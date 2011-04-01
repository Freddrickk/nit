/* This C header file is generated by NIT to compile modules and programs that requires flow. */
#ifndef flow_sep
#define flow_sep
#include "syntax_base._sep.h"
#include <nit_common.h>

extern const classtable_elt_t VFT_FlowContext[];

extern const classtable_elt_t VFT_RootFlowContext[];

extern const classtable_elt_t VFT_SubFlowContext[];

extern const classtable_elt_t VFT_CastFlowContext[];

extern const classtable_elt_t VFT_MergeFlowContext[];
extern const char *LOCATE_flow;
extern const int SFT_flow[];
#define ID_FlowContext (SFT_flow[0])
#define COLOR_FlowContext (SFT_flow[1])
#define ATTR_flow___FlowContext____visitor(recv) ATTR(recv, (SFT_flow[2] + 0))
#define ATTR_flow___FlowContext____node(recv) ATTR(recv, (SFT_flow[2] + 1))
#define ATTR_flow___FlowContext____unreash(recv) ATTR(recv, (SFT_flow[2] + 2))
#define ATTR_flow___FlowContext____already_unreash(recv) ATTR(recv, (SFT_flow[2] + 3))
#define ATTR_flow___FlowContext____set_variables(recv) ATTR(recv, (SFT_flow[2] + 4))
#define INIT_TABLE_POS_FlowContext (SFT_flow[3] + 0)
#define CALL_flow___FlowContext___check_is_set(recv) ((flow___FlowContext___check_is_set_t)CALL((recv), (SFT_flow[3] + 1)))
#define CALL_flow___FlowContext___stype(recv) ((flow___FlowContext___stype_t)CALL((recv), (SFT_flow[3] + 2)))
#define CALL_flow___FlowContext___sub_setvariable(recv) ((flow___FlowContext___sub_setvariable_t)CALL((recv), (SFT_flow[3] + 3)))
#define CALL_flow___FlowContext___sub_unreash(recv) ((flow___FlowContext___sub_unreash_t)CALL((recv), (SFT_flow[3] + 4)))
#define CALL_flow___FlowContext___sub_with(recv) ((flow___FlowContext___sub_with_t)CALL((recv), (SFT_flow[3] + 5)))
#define CALL_flow___FlowContext___merge(recv) ((flow___FlowContext___merge_t)CALL((recv), (SFT_flow[3] + 6)))
#define CALL_flow___FlowContext___merge_reash(recv) ((flow___FlowContext___merge_reash_t)CALL((recv), (SFT_flow[3] + 7)))
#define CALL_flow___FlowContext___node(recv) ((flow___FlowContext___node_t)CALL((recv), (SFT_flow[3] + 8)))
#define CALL_flow___FlowContext___init(recv) ((flow___FlowContext___init_t)CALL((recv), (SFT_flow[3] + 9)))
#define CALL_flow___FlowContext___unreash(recv) ((flow___FlowContext___unreash_t)CALL((recv), (SFT_flow[3] + 10)))
#define CALL_flow___FlowContext___already_unreash(recv) ((flow___FlowContext___already_unreash_t)CALL((recv), (SFT_flow[3] + 11)))
#define CALL_flow___FlowContext___already_unreash__eq(recv) ((flow___FlowContext___already_unreash__eq_t)CALL((recv), (SFT_flow[3] + 12)))
#define CALL_flow___FlowContext___set_variables(recv) ((flow___FlowContext___set_variables_t)CALL((recv), (SFT_flow[3] + 13)))
#define CALL_flow___FlowContext___is_set(recv) ((flow___FlowContext___is_set_t)CALL((recv), (SFT_flow[3] + 14)))
#define ID_RootFlowContext (SFT_flow[4])
#define COLOR_RootFlowContext (SFT_flow[5])
#define INIT_TABLE_POS_RootFlowContext (SFT_flow[6] + 0)
#define CALL_flow___RootFlowContext___init(recv) ((flow___RootFlowContext___init_t)CALL((recv), (SFT_flow[6] + 1)))
#define ID_SubFlowContext (SFT_flow[7])
#define COLOR_SubFlowContext (SFT_flow[8])
#define ATTR_flow___SubFlowContext____prev(recv) ATTR(recv, (SFT_flow[9] + 0))
#define INIT_TABLE_POS_SubFlowContext (SFT_flow[10] + 0)
#define CALL_flow___SubFlowContext___prev(recv) ((flow___SubFlowContext___prev_t)CALL((recv), (SFT_flow[10] + 1)))
#define CALL_flow___SubFlowContext___with_prev(recv) ((flow___SubFlowContext___with_prev_t)CALL((recv), (SFT_flow[10] + 2)))
#define ID_CastFlowContext (SFT_flow[11])
#define COLOR_CastFlowContext (SFT_flow[12])
#define ATTR_flow___CastFlowContext____variable(recv) ATTR(recv, (SFT_flow[13] + 0))
#define ATTR_flow___CastFlowContext____stype(recv) ATTR(recv, (SFT_flow[13] + 1))
#define INIT_TABLE_POS_CastFlowContext (SFT_flow[14] + 0)
#define CALL_flow___CastFlowContext___init(recv) ((flow___CastFlowContext___init_t)CALL((recv), (SFT_flow[14] + 1)))
#define ID_MergeFlowContext (SFT_flow[15])
#define COLOR_MergeFlowContext (SFT_flow[16])
#define ATTR_flow___MergeFlowContext____base(recv) ATTR(recv, (SFT_flow[17] + 0))
#define ATTR_flow___MergeFlowContext____alts(recv) ATTR(recv, (SFT_flow[17] + 1))
#define ATTR_flow___MergeFlowContext____stypes(recv) ATTR(recv, (SFT_flow[17] + 2))
#define INIT_TABLE_POS_MergeFlowContext (SFT_flow[18] + 0)
#define CALL_flow___MergeFlowContext___init(recv) ((flow___MergeFlowContext___init_t)CALL((recv), (SFT_flow[18] + 1)))
#define CALL_flow___MergeFlowContext___merge_stype(recv) ((flow___MergeFlowContext___merge_stype_t)CALL((recv), (SFT_flow[18] + 2)))
#define CALL_flow___Variable___must_be_set(recv) ((flow___Variable___must_be_set_t)CALL((recv), (SFT_flow[19] + 0)))
static const char * const LOCATE_flow___FlowContext___check_is_set = "flow::FlowContext::check_is_set";
void flow___FlowContext___check_is_set(val_t p0, val_t p1, val_t p2);
typedef void (*flow___FlowContext___check_is_set_t)(val_t p0, val_t p1, val_t p2);
static const char * const LOCATE_flow___FlowContext___stype = "flow::FlowContext::stype";
val_t flow___FlowContext___stype(val_t p0, val_t p1);
typedef val_t (*flow___FlowContext___stype_t)(val_t p0, val_t p1);
static const char * const LOCATE_flow___FlowContext___sub_setvariable = "flow::FlowContext::sub_setvariable";
val_t flow___FlowContext___sub_setvariable(val_t p0, val_t p1);
typedef val_t (*flow___FlowContext___sub_setvariable_t)(val_t p0, val_t p1);
static const char * const LOCATE_flow___FlowContext___sub_unreash = "flow::FlowContext::sub_unreash";
val_t flow___FlowContext___sub_unreash(val_t p0, val_t p1);
typedef val_t (*flow___FlowContext___sub_unreash_t)(val_t p0, val_t p1);
static const char * const LOCATE_flow___FlowContext___sub_with = "flow::FlowContext::sub_with";
val_t flow___FlowContext___sub_with(val_t p0, val_t p1, val_t p2, val_t p3);
typedef val_t (*flow___FlowContext___sub_with_t)(val_t p0, val_t p1, val_t p2, val_t p3);
static const char * const LOCATE_flow___FlowContext___merge = "flow::FlowContext::merge";
val_t flow___FlowContext___merge(val_t p0, val_t p1, val_t p2);
typedef val_t (*flow___FlowContext___merge_t)(val_t p0, val_t p1, val_t p2);
static const char * const LOCATE_flow___FlowContext___merge_reash = "flow::FlowContext::merge_reash";
val_t flow___FlowContext___merge_reash(val_t p0, val_t p1, val_t p2, val_t p3);
typedef val_t (*flow___FlowContext___merge_reash_t)(val_t p0, val_t p1, val_t p2, val_t p3);
static const char * const LOCATE_flow___FlowContext___node = "flow::FlowContext::node";
val_t flow___FlowContext___node(val_t p0);
typedef val_t (*flow___FlowContext___node_t)(val_t p0);
static const char * const LOCATE_flow___FlowContext___init = "flow::FlowContext::init";
void flow___FlowContext___init(val_t p0, val_t p1, val_t p2, int* init_table);
typedef void (*flow___FlowContext___init_t)(val_t p0, val_t p1, val_t p2, int* init_table);
val_t NEW_FlowContext_flow___FlowContext___init(val_t p0, val_t p1);
static const char * const LOCATE_flow___FlowContext___unreash = "flow::FlowContext::unreash";
val_t flow___FlowContext___unreash(val_t p0);
typedef val_t (*flow___FlowContext___unreash_t)(val_t p0);
static const char * const LOCATE_flow___FlowContext___already_unreash = "flow::FlowContext::already_unreash";
val_t flow___FlowContext___already_unreash(val_t p0);
typedef val_t (*flow___FlowContext___already_unreash_t)(val_t p0);
static const char * const LOCATE_flow___FlowContext___already_unreash__eq = "flow::FlowContext::already_unreash=";
void flow___FlowContext___already_unreash__eq(val_t p0, val_t p1);
typedef void (*flow___FlowContext___already_unreash__eq_t)(val_t p0, val_t p1);
static const char * const LOCATE_flow___FlowContext___set_variables = "flow::FlowContext::set_variables";
val_t flow___FlowContext___set_variables(val_t p0);
typedef val_t (*flow___FlowContext___set_variables_t)(val_t p0);
static const char * const LOCATE_flow___FlowContext___is_set = "flow::FlowContext::is_set";
val_t flow___FlowContext___is_set(val_t p0, val_t p1);
typedef val_t (*flow___FlowContext___is_set_t)(val_t p0, val_t p1);
static const char * const LOCATE_flow___RootFlowContext___init = "flow::RootFlowContext::init";
void flow___RootFlowContext___init(val_t p0, val_t p1, val_t p2, int* init_table);
typedef void (*flow___RootFlowContext___init_t)(val_t p0, val_t p1, val_t p2, int* init_table);
val_t NEW_RootFlowContext_flow___RootFlowContext___init(val_t p0, val_t p1);
static const char * const LOCATE_flow___SubFlowContext___prev = "flow::SubFlowContext::prev";
val_t flow___SubFlowContext___prev(val_t p0);
typedef val_t (*flow___SubFlowContext___prev_t)(val_t p0);
static const char * const LOCATE_flow___SubFlowContext___is_set = "flow::SubFlowContext::(flow::FlowContext::is_set)";
val_t flow___SubFlowContext___is_set(val_t p0, val_t p1);
typedef val_t (*flow___SubFlowContext___is_set_t)(val_t p0, val_t p1);
static const char * const LOCATE_flow___SubFlowContext___stype = "flow::SubFlowContext::(flow::FlowContext::stype)";
val_t flow___SubFlowContext___stype(val_t p0, val_t p1);
typedef val_t (*flow___SubFlowContext___stype_t)(val_t p0, val_t p1);
static const char * const LOCATE_flow___SubFlowContext___with_prev = "flow::SubFlowContext::with_prev";
void flow___SubFlowContext___with_prev(val_t p0, val_t p1, val_t p2, int* init_table);
typedef void (*flow___SubFlowContext___with_prev_t)(val_t p0, val_t p1, val_t p2, int* init_table);
val_t NEW_SubFlowContext_flow___SubFlowContext___with_prev(val_t p0, val_t p1);
static const char * const LOCATE_flow___CastFlowContext___stype = "flow::CastFlowContext::(flow::FlowContext::stype)";
val_t flow___CastFlowContext___stype(val_t p0, val_t p1);
typedef val_t (*flow___CastFlowContext___stype_t)(val_t p0, val_t p1);
static const char * const LOCATE_flow___CastFlowContext___init = "flow::CastFlowContext::init";
void flow___CastFlowContext___init(val_t p0, val_t p1, val_t p2, val_t p3, val_t p4, int* init_table);
typedef void (*flow___CastFlowContext___init_t)(val_t p0, val_t p1, val_t p2, val_t p3, val_t p4, int* init_table);
val_t NEW_CastFlowContext_flow___CastFlowContext___init(val_t p0, val_t p1, val_t p2, val_t p3);
static const char * const LOCATE_flow___MergeFlowContext___init = "flow::MergeFlowContext::init";
void flow___MergeFlowContext___init(val_t p0, val_t p1, val_t p2, val_t p3, int* init_table);
typedef void (*flow___MergeFlowContext___init_t)(val_t p0, val_t p1, val_t p2, val_t p3, int* init_table);
val_t NEW_MergeFlowContext_flow___MergeFlowContext___init(val_t p0, val_t p1, val_t p2);
static const char * const LOCATE_flow___MergeFlowContext___stype = "flow::MergeFlowContext::(flow::FlowContext::stype)";
val_t flow___MergeFlowContext___stype(val_t p0, val_t p1);
typedef val_t (*flow___MergeFlowContext___stype_t)(val_t p0, val_t p1);
static const char * const LOCATE_flow___MergeFlowContext___merge_stype = "flow::MergeFlowContext::merge_stype";
val_t flow___MergeFlowContext___merge_stype(val_t p0, val_t p1);
typedef val_t (*flow___MergeFlowContext___merge_stype_t)(val_t p0, val_t p1);
static const char * const LOCATE_flow___MergeFlowContext___is_set = "flow::MergeFlowContext::(flow::FlowContext::is_set)";
val_t flow___MergeFlowContext___is_set(val_t p0, val_t p1);
typedef val_t (*flow___MergeFlowContext___is_set_t)(val_t p0, val_t p1);
static const char * const LOCATE_flow___Variable___must_be_set = "flow::Variable::must_be_set";
val_t flow___Variable___must_be_set(val_t p0);
typedef val_t (*flow___Variable___must_be_set_t)(val_t p0);
val_t NEW_Variable_syntax_base___Variable___init(val_t p0, val_t p1);
static const char * const LOCATE_flow___VarVariable___must_be_set = "flow::VarVariable::(flow::Variable::must_be_set)";
val_t flow___VarVariable___must_be_set(val_t p0);
typedef val_t (*flow___VarVariable___must_be_set_t)(val_t p0);
val_t NEW_VarVariable_syntax_base___VarVariable___init(val_t p0, val_t p1);
#endif