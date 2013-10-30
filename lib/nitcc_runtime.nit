# This file is part of NIT ( http://www.nitlanguage.org ).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Runtime library required by parsers and lexers generated by nitcc
module nitcc_runtime

# A abstract parser engine generated by nitcc
abstract class Parser
	# The list of tokens
	# FIXME: provide something better, like a lexer?
	var tokens = new List[NToken]

	# Look at the next token
	# Used by generated parsers
	fun peek_token: NToken do return tokens.first

	# Consume the next token
	# Used by generated parsers
	fun get_token: NToken do return tokens.shift

	# Consume the next token and shift to the state `dest`.
	# Used by generated parsers
	fun shift(dest: LRState)
	do
		var t = get_token
		#print "shift {t} -> {dest}"
		node_stack.push t
		state_stack.push state
		state = dest
	end

	# After a reduction on `goto` go to the next state
	# Used by generated parsers
	fun goto(goto: LRGoto)
	do
		#print "reduce from {state} -> {prod}"
		state.goto(self, goto)
	end

	# push a new state on the stack of states (
	# Used by generated parsers
	fun push(dest: LRState)
	do
		#print "push prod {prod} -> {dest}"
		state_stack.push state
		state = dest
	end

	# Pop and return the last node
	# Also pop (and discard) the associated state
	# Used by generated parsers
	fun pop: Node
	do
		var res = node_stack.pop
		state = state_stack.pop
		return res
	end

	# Produce a parse error and stop the parsing
	# Used by generated parsers
	fun parse_error
	do
		var token = peek_token
		#print "* parse error in state {state} on token {token}"
		#print "  expected: {state.error_msg}"
		#print "  node_stack={node_stack.join(", ")}"
		#print "  state_stack={state_stack.join(", ")}"
		node_stack.add(token)
		var error: NError
		if token isa NLexerError then
			error = token
		else
			error = new NParserError
			error.position = token.position
			error.text = token.text
			error.token = token
		end
		error.error_tree.children.add_all(node_stack)
		error.expected = state.error_msg
		node_stack.clear
		node_stack.add error
		stop = true
	end

	# The stating state for parsing
	# Used by generated parsers
	protected fun start_state: LRState is abstract

	# The current state
	# Used by generated parsers
	var state: LRState

	init
	do
		state = start_state
	end

	# The stack of nodes
	# Used by generated parsers
	var node_stack = new Array[Node]

	# The stack of states
	# Used by generated parsers
	var state_stack = new Array[LRState]

	# Should the parser stop
	# Used by generated parsers
	var stop writable = true

	# Parse a full sequence of tokens and return a complete syntactic tree
	fun parse: Node
	do
		state = start_state
		state_stack.clear
		node_stack.clear
		stop = false
		while not stop do
			#print "* current state {state}"
			#print "  tokens={tokens.join(" ")}"
			#print "  node_stack={node_stack.join(" ")}"
			#print "  state_stack={state_stack.join(" ")}"
			state.action(self)
		end
		#print "* over"
		return node_stack.first
	end
end

# A state in a parser LR automaton generated by nitcc
# Used by generated parsers
abstract class LRState
	fun action(parser: Parser) is abstract
	fun goto(parser: Parser, goto: LRGoto) is abstract
	fun error_msg: String do return "FIXME"
end

# A concrete production in a parser LR automation generated by nitcc
# Used by generated parsers
abstract class LRGoto
end

###

# A abstract lexer engine generated by nitcc
abstract class Lexer
	# The input stream of characters
	var stream: String

	# The stating state for lexing
	# Used by generated parsers
	protected fun start_state: DFAState is abstract

	# Lexize a stream of characters and return a sequence of tokens
	fun lex: List[NToken]
	do
		var res = new List[NToken]
		var state = start_state
		var pos = 0
		var pos_start = 0
		var pos_end = 0
		var line = 1
		var line_start = 1
		var line_end = 0
		var col = 1
		var col_start = 1
		var col_end = 0
		var last_state: nullable DFAState = null
		var text = stream
		var length = text.length
		loop
			if state.is_accept then
				pos_end = pos - 1
				line_end = line
				col_end = col
				last_state = state
			end
			var c
			if pos >= length then
				c = '\0'
			else
				c = text[pos]
			end
			var next = state.trans(c)
			if next == null then
				if pos_start < length then
					if last_state == null then
						var token = new NLexerError
						var position = new Position(pos_start, pos, line_start, line, col_start, col)
						token.position = position
						token.text = text.substring(pos_start, pos-pos_start+1)
						res.add token
						break
					end
					var position = new Position(pos_start, pos_end, line_start, line_end, col_start, col_end)
					var token = last_state.make_token(position, text.substring(pos_start, pos_end-pos_start+1))
					if token != null then res.add(token)
				end
				if pos >= length then
					var token = new NEof
					var position = new Position(pos, pos, line, line, col, col)
					token.position = position
					token.text = ""
					res.add token
					break
				end
				state = start_state
				pos_start = pos_end + 1
				pos = pos_start
				line_start = line_end
				line = line_start
				col_start = col_end
				col = col_start

				last_state = null
				continue
			end
			state = next
			pos += 1
			col += 1
			if c == '\n' then
				line += 1
				col = 1
			end
		end
		return res
	end
end

# A state in a lexer automaton generated by nitcc
# Used by generated lexers
interface DFAState
	fun is_accept: Bool do return false
	fun trans(c: Char): nullable DFAState do return null
	fun make_token(position: Position, text: String): nullable NToken is abstract
end

###

# A abstract visitor on syntactic trees generated by nitcc
abstract class Visitor
	# The main entry point to visit a node `n`
	# Should not be redefined
	fun enter_visit(n: Node)
	do
		visit(n)
	end

	# The specific implementation of a visit
	#
	# Should be redefined by concrete visitors
	#
	# Should not be called directly (use `enter_visit` instead)
	#
	# By default, the visitor just rescursively visit the children of `n`
	protected fun visit(n: Node)
	do
		n.visit_children(self)
	end
end

# Print a node (using to_s) on a line and recustively each children indented (with two spaces)
class TreePrinterVisitor
	super Visitor
	var writer: OStream
	private var indent = 0
	init(writer: OStream) do self.writer = writer
	redef fun visit(n)
	do
		for i in [0..indent[ do writer.write("  ")
		writer.write(n.to_s)
		writer.write("\n")
		indent += 1
		super
		indent -= 1
	end
end

# A position into a input stream
# Used to give position to tokens
class Position
	var pos_start: Int
	var pos_end: Int
	var line_start: Int
	var line_end: Int
	var col_start: Int
	var col_end: Int
	redef fun to_s do return "{line_start}:{col_start}-{line_end}:{col_end}"
end

# A node of a syntactic tree
abstract class Node
	# The name of the node (as used in the grammar file)
	fun node_name: String do return class_name

	# A point of view on the direct children of the node
	fun children: SequenceRead[nullable Node] is abstract

	# Visit all the children of the node with the visitor `v`
	protected fun visit_children(v: Visitor)
	do
		for c in children do if c != null then v.enter_visit(c)
	end

	# The position of the node in the input stream
	var position: nullable Position writable = null

	# Produce a graphiz file for the syntaxtic tree rooted at `self`.
	fun to_dot(filepath: String)
	do
		var f = new OFStream.open(filepath)
		f.write("digraph g \{\n")
		f.write("rankdir=BT;\n")

		var a = new Array[NToken]
		to_dot_visitor(f, a)

		f.write("\{ rank=same\n")
		var first = true
		for n in a do
			if first then
				first = false
			else
				f.write("->")
			end
			f.write("n{n.object_id}")
		end
		f.write("[style=invis];\n")
		f.write("\}\n")

		f.write("\}\n")
		f.close
	end

	private fun to_dot_visitor(f: OStream, a: Array[NToken])
	do
		f.write("n{object_id} [label=\"{node_name}\"];\n")
		for x in children do
			if x == null then continue
			f.write("n{x.object_id} -> n{object_id};\n")
			x.to_dot_visitor(f,a )
		end
	end

	redef fun to_s do
		var pos = position
		if pos == null then
			return "{node_name}"
		else
			return "{node_name}@({pos})"
		end
	end
end

# A token produced by the lexer and used in a syntactic tree
abstract class NToken
	super Node

	redef fun children do return once new Array[Node]

	redef fun to_dot_visitor(f, a)
	do
		var labe = "{node_name}"
		var pos = position
		if pos != null then labe += "\\n{pos}"
		var text = self.text
		if node_name != "'{text}'" then
			labe += "\\n'{text.escape_to_c}'"
		end
		f.write("n{object_id} [label=\"{labe}\",shape=box];\n")
		a.add(self)
	end

	# The text associated with the token
	var text: String writable = ""

	redef fun to_s do
		var res = super
		var text = self.text
		if node_name != "'{text}'" then
			res += "='{text.escape_to_c}'"
		end
		return res
	end
end

# The special token for the end of stream
class NEof
	super NToken
end

# A special token used to represent a parser or lexer error
abstract class NError
	super NToken

	# All the partially built tree during parsing (aka the node_stack)
	var error_tree = new Nodes[Node]

	# The things unexpected
	fun unexpected: String is abstract

	# The things expected (if any)
	var expected: nullable String = null

	# The error message,using `expected` and `unexpected`
	fun message: String
	do
		var exp = expected
		var res = "Unexpected {unexpected}"
		if exp != null then res += "; is acceptable instead: {exp}"
		return res
	end
end

# A lexer error as a token for the unexpected characted
class NLexerError
	super NError

	redef fun unexpected do return "character '{text.first}'"
end

# A parser error linked to a unexpected token
class NParserError
	super NError
	# The unexpected token
	var token: nullable NToken

	redef fun unexpected
	do
		var res = token.node_name
		var text = token.text
		if not text.is_empty and res != "'{text}'" then
			res += " '{text.escape_to_c}'"
		end
		return res
	end
end

# A hogeneous sequence of node, used to represent unbounded lists (and + modifier)
class Nodes[T: Node]
	super Node
	redef var children = new Array[T]
end

# A production with a specific, named and statically typed children
class NProd
	super Node
	redef var children: SequenceRead[nullable Node] = new NProdChildren(self)

	# The exact number of direct children
	# Used to implement `children` by generated parsers
	fun number_of_children: Int is abstract

	# The specific children got by its index
	# Used to implement `children` by generated parsers
	fun child(x: Int): nullable Node is abstract
end


private class NProdChildren
	super SequenceRead[nullable Node]
	var prod: NProd
	redef fun iterator do return new NProdIterator(prod)
	redef fun length do return prod.number_of_children
	redef fun is_empty do return prod.number_of_children == 0
	redef fun [](i) do return prod.child(i)
end

private class NProdIterator
	super IndexedIterator[nullable Node]
	var prod: NProd
	redef var index = 0
	redef fun is_ok do return index < prod.number_of_children
	redef fun next do index += 1
	redef fun item do return prod.child(index)
end

# All-in-one abstract class to test generated parsers on a given
abstract class TestParser
	# How to get a new lexer on a given stream of character
	fun new_lexer(text: String): Lexer is abstract

	# How to get a new parser
	fun new_parser: Parser is abstract

	# The name of the language (used for generated files)
	fun name: String is abstract

	# Use the class as the main enrty point of the program
	# - parse arguments and options of the command
	# - test the parser (see `work`)
	fun main: Node
	do
		if args.is_empty then
			print "usage {name}_test <filepath> | - | -e <text>"
			exit 0
		end

		var filepath = args.shift
		var text
		if filepath == "-" then
			text = stdin.read_all
		else if filepath == "-e" then
			if args.is_empty then
				print "Error: -e need a text"
				exit 1
			end
			text = args.shift
		else
			var f = new IFStream.open(filepath)
			text = f.read_all
			f.close
		end

		if not args.is_empty then
			print "Error: superfluous arguments."
			exit 1
		end

		return work(text)
	end

	# Produce a full syntactic tree for a given stream of character
	# Produce also statistics and output files
	fun work(text: String): Node
	do
		print "INPUT: {text.length} chars"
		var l = new_lexer(text)
		var tokens = l.lex

		var tokout = "{name}.tokens.out"
		print "TOKEN: {tokens.length} tokens (see {tokout})"

		var f = new OFStream.open(tokout)
		for t in tokens do
			f.write "{t.to_s}\n"
		end
		f.close

		var p = new_parser
		p.tokens.add_all(tokens)

		var n = p.parse

		var astout = "{name}.ast.out"
		f = new OFStream.open(astout)
		var tpv = new TreePrinterVisitor(f)
		var astdotout = "{name}.ast.dot"
		if n isa NError then
			print "Syntax error: {n.message}"
			print "ERROR: {n} (see {astout} and {astdotout})"
			tpv.enter_visit(n)
			n = n.error_tree
		else
			print "ROOT: {n} (see {astout} and {astdotout})"
		end
		tpv.enter_visit(n)
		n.to_dot(astdotout)
		f.close

		return n
	end
end
