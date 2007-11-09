/* Automatically generated.  Do not edit */
/* See the mkopcodec.awk script for details. */
#include "windllexport.h"
#if !defined(SQLITE_OMIT_EXPLAIN) || !defined(NDEBUG) || defined(VDBE_PROFILE) || defined(SQLITE_DEBUG)
const char *sqlite3OpcodeName(int i){
 static const char *const azName[] = { "?",
     /*   1 */ "MemLoad",
     /*   2 */ "VNext",
     /*   3 */ "Column",
     /*   4 */ "SetCookie",
     /*   5 */ "IfMemPos",
     /*   6 */ "Sequence",
     /*   7 */ "MoveGt",
     /*   8 */ "RowKey",
     /*   9 */ "OpenWrite",
     /*  10 */ "If",
     /*  11 */ "Pop",
     /*  12 */ "VRowid",
     /*  13 */ "CollSeq",
     /*  14 */ "OpenRead",
     /*  15 */ "Expire",
     /*  16 */ "Not",
     /*  17 */ "AutoCommit",
     /*  18 */ "IntegrityCk",
     /*  19 */ "Sort",
     /*  20 */ "Function",
     /*  21 */ "Noop",
     /*  22 */ "Return",
     /*  23 */ "NewRowid",
     /*  24 */ "IfMemNeg",
     /*  25 */ "Variable",
     /*  26 */ "String",
     /*  27 */ "RealAffinity",
     /*  28 */ "VRename",
     /*  29 */ "ParseSchema",
     /*  30 */ "VOpen",
     /*  31 */ "Close",
     /*  32 */ "CreateIndex",
     /*  33 */ "IsUnique",
     /*  34 */ "NotFound",
     /*  35 */ "Int64",
     /*  36 */ "MustBeInt",
     /*  37 */ "Halt",
     /*  38 */ "Rowid",
     /*  39 */ "IdxLT",
     /*  40 */ "AddImm",
     /*  41 */ "Statement",
     /*  42 */ "RowData",
     /*  43 */ "MemMax",
     /*  44 */ "Push",
     /*  45 */ "NotExists",
     /*  46 */ "MemIncr",
     /*  47 */ "Gosub",
     /*  48 */ "Integer",
     /*  49 */ "MemInt",
     /*  50 */ "Prev",
     /*  51 */ "VColumn",
     /*  52 */ "CreateTable",
     /*  53 */ "Last",
     /*  54 */ "IncrVacuum",
     /*  55 */ "IdxRowid",
     /*  56 */ "MakeIdxRec",
     /*  57 */ "ResetCount",
     /*  58 */ "FifoWrite",
     /*  59 */ "Callback",
     /*  60 */ "Or",
     /*  61 */ "And",
     /*  62 */ "ContextPush",
     /*  63 */ "DropTrigger",
     /*  64 */ "DropIndex",
     /*  65 */ "IsNull",
     /*  66 */ "NotNull",
     /*  67 */ "Ne",
     /*  68 */ "Eq",
     /*  69 */ "Gt",
     /*  70 */ "Le",
     /*  71 */ "Lt",
     /*  72 */ "Ge",
     /*  73 */ "IdxGE",
     /*  74 */ "BitAnd",
     /*  75 */ "BitOr",
     /*  76 */ "ShiftLeft",
     /*  77 */ "ShiftRight",
     /*  78 */ "Add",
     /*  79 */ "Subtract",
     /*  80 */ "Multiply",
     /*  81 */ "Divide",
     /*  82 */ "Remainder",
     /*  83 */ "Concat",
     /*  84 */ "IdxDelete",
     /*  85 */ "Negative",
     /*  86 */ "Vacuum",
     /*  87 */ "BitNot",
     /*  88 */ "String8",
     /*  89 */ "MoveLe",
     /*  90 */ "IfNot",
     /*  91 */ "DropTable",
     /*  92 */ "MakeRecord",
     /*  93 */ "Delete",
     /*  94 */ "AggFinal",
     /*  95 */ "Dup",
     /*  96 */ "Goto",
     /*  97 */ "TableLock",
     /*  98 */ "FifoRead",
     /*  99 */ "Clear",
     /* 100 */ "IdxGT",
     /* 101 */ "MoveLt",
     /* 102 */ "VerifyCookie",
     /* 103 */ "AggStep",
     /* 104 */ "Pull",
     /* 105 */ "SetNumColumns",
     /* 106 */ "AbsValue",
     /* 107 */ "Transaction",
     /* 108 */ "VFilter",
     /* 109 */ "VDestroy",
     /* 110 */ "ContextPop",
     /* 111 */ "Next",
     /* 112 */ "IdxInsert",
     /* 113 */ "Distinct",
     /* 114 */ "Insert",
     /* 115 */ "Destroy",
     /* 116 */ "ReadCookie",
     /* 117 */ "ForceInt",
     /* 118 */ "LoadAnalysis",
     /* 119 */ "Explain",
     /* 120 */ "IfMemZero",
     /* 121 */ "OpenPseudo",
     /* 122 */ "OpenEphemeral",
     /* 123 */ "Null",
     /* 124 */ "Blob",
     /* 125 */ "Real",
     /* 126 */ "HexBlob",
     /* 127 */ "MemStore",
     /* 128 */ "Rewind",
     /* 129 */ "MoveGe",
     /* 130 */ "VBegin",
     /* 131 */ "VUpdate",
     /* 132 */ "VCreate",
     /* 133 */ "MemMove",
     /* 134 */ "MemNull",
     /* 135 */ "Found",
     /* 136 */ "NullRow",
     /* 137 */ "NotUsed_137",
     /* 138 */ "ToText",
     /* 139 */ "ToBlob",
     /* 140 */ "ToNumeric",
     /* 141 */ "ToInt",
     /* 142 */ "ToReal",
  };
  return azName[i];
}
#endif