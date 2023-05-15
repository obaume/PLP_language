{-# OPTIONS_GHC -w #-}
module Parser (parser) where
import Lexer
import Lang
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,391) ([0,5968,562,1,12288,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,29952,8993,16,0,3,0,0,8565,4131,0,0,0,0,0,0,0,0,0,256,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5968,562,1,0,56560,79,0,0,0,0,0,0,0,5968,562,3,29952,8993,16,32768,52992,253,0,2,0,0,0,0,0,29952,8993,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,4096,0,5968,562,1,12288,0,32,0,0,0,0,8565,4131,0,37632,0,1,0,56560,47,0,52992,1277,0,0,8192,0,0,0,0,29952,8993,16,0,52992,765,0,0,0,0,5968,562,1,29952,8993,16,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,1024,0,256,0,0,5968,562,1,0,0,0,0,0,0,0,0,0,0,768,0,0,29952,8993,16,20480,12823,258,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8565,4131,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Stmt","Def","FuncDef","Params","Param","Expr","Value","Tuple","FuncApp","Args","Cond","Type","CasePatterns","CasePattern","Pattern","UnaryOp","BinaryOp","let","in","case","of","'int'","'bool'","'if'","'else'","'name'","'->'","'='","'_'","'+'","'-'","'*'","'/'","'++'","'--'","'%'","'=='","'!='","'!'","'<'","'<='","'>'","'>='","'&&'","'||'","'('","')'","','","%eof"]
        bit_start = st Prelude.* 52
        bit_end = (st Prelude.+ 1) Prelude.* 52
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..51]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (21) = happyShift action_14
action_0 (23) = happyShift action_15
action_0 (25) = happyShift action_16
action_0 (26) = happyShift action_17
action_0 (27) = happyShift action_18
action_0 (29) = happyShift action_19
action_0 (34) = happyShift action_20
action_0 (37) = happyShift action_21
action_0 (38) = happyShift action_22
action_0 (42) = happyShift action_23
action_0 (49) = happyShift action_24
action_0 (4) = happyGoto action_7
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (9) = happyGoto action_8
action_0 (10) = happyGoto action_9
action_0 (11) = happyGoto action_10
action_0 (12) = happyGoto action_11
action_0 (14) = happyGoto action_12
action_0 (15) = happyGoto action_4
action_0 (19) = happyGoto action_13
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (25) = happyShift action_5
action_1 (26) = happyShift action_6
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (15) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 _ = happyReduce_4

action_4 (29) = happyShift action_47
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_27

action_6 _ = happyReduce_28

action_7 (52) = happyAccept
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (33) = happyShift action_34
action_8 (34) = happyShift action_35
action_8 (35) = happyShift action_36
action_8 (36) = happyShift action_37
action_8 (39) = happyShift action_38
action_8 (40) = happyShift action_39
action_8 (41) = happyShift action_40
action_8 (43) = happyShift action_41
action_8 (44) = happyShift action_42
action_8 (45) = happyShift action_43
action_8 (46) = happyShift action_44
action_8 (47) = happyShift action_45
action_8 (48) = happyShift action_46
action_8 (20) = happyGoto action_33
action_8 _ = happyReduce_2

action_9 _ = happyReduce_10

action_10 _ = happyReduce_19

action_11 _ = happyReduce_11

action_12 _ = happyReduce_12

action_13 (21) = happyShift action_14
action_13 (23) = happyShift action_15
action_13 (25) = happyShift action_26
action_13 (26) = happyShift action_27
action_13 (27) = happyShift action_18
action_13 (29) = happyShift action_19
action_13 (34) = happyShift action_20
action_13 (37) = happyShift action_21
action_13 (38) = happyShift action_22
action_13 (42) = happyShift action_23
action_13 (49) = happyShift action_24
action_13 (9) = happyGoto action_32
action_13 (10) = happyGoto action_9
action_13 (11) = happyGoto action_10
action_13 (12) = happyGoto action_11
action_13 (14) = happyGoto action_12
action_13 (19) = happyGoto action_13
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (25) = happyShift action_5
action_14 (26) = happyShift action_6
action_14 (5) = happyGoto action_31
action_14 (6) = happyGoto action_3
action_14 (15) = happyGoto action_4
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (21) = happyShift action_14
action_15 (23) = happyShift action_15
action_15 (25) = happyShift action_26
action_15 (26) = happyShift action_27
action_15 (27) = happyShift action_18
action_15 (29) = happyShift action_19
action_15 (34) = happyShift action_20
action_15 (37) = happyShift action_21
action_15 (38) = happyShift action_22
action_15 (42) = happyShift action_23
action_15 (49) = happyShift action_24
action_15 (9) = happyGoto action_30
action_15 (10) = happyGoto action_9
action_15 (11) = happyGoto action_10
action_15 (12) = happyGoto action_11
action_15 (14) = happyGoto action_12
action_15 (19) = happyGoto action_13
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (29) = happyReduce_27
action_16 _ = happyReduce_17

action_17 (29) = happyReduce_28
action_17 _ = happyReduce_18

action_18 (49) = happyShift action_29
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (49) = happyShift action_28
action_19 _ = happyFail (happyExpListPerState 19)

action_20 _ = happyReduce_35

action_21 _ = happyReduce_36

action_22 _ = happyReduce_37

action_23 _ = happyReduce_38

action_24 (21) = happyShift action_14
action_24 (23) = happyShift action_15
action_24 (25) = happyShift action_26
action_24 (26) = happyShift action_27
action_24 (27) = happyShift action_18
action_24 (29) = happyShift action_19
action_24 (34) = happyShift action_20
action_24 (37) = happyShift action_21
action_24 (38) = happyShift action_22
action_24 (42) = happyShift action_23
action_24 (49) = happyShift action_24
action_24 (9) = happyGoto action_25
action_24 (10) = happyGoto action_9
action_24 (11) = happyGoto action_10
action_24 (12) = happyGoto action_11
action_24 (14) = happyGoto action_12
action_24 (19) = happyGoto action_13
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (33) = happyShift action_34
action_25 (34) = happyShift action_35
action_25 (35) = happyShift action_36
action_25 (36) = happyShift action_37
action_25 (39) = happyShift action_38
action_25 (40) = happyShift action_39
action_25 (41) = happyShift action_40
action_25 (43) = happyShift action_41
action_25 (44) = happyShift action_42
action_25 (45) = happyShift action_43
action_25 (46) = happyShift action_44
action_25 (47) = happyShift action_45
action_25 (48) = happyShift action_46
action_25 (51) = happyShift action_57
action_25 (20) = happyGoto action_33
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_17

action_27 _ = happyReduce_18

action_28 (21) = happyShift action_14
action_28 (23) = happyShift action_15
action_28 (25) = happyShift action_26
action_28 (26) = happyShift action_27
action_28 (27) = happyShift action_18
action_28 (29) = happyShift action_19
action_28 (34) = happyShift action_20
action_28 (37) = happyShift action_21
action_28 (38) = happyShift action_22
action_28 (42) = happyShift action_23
action_28 (49) = happyShift action_24
action_28 (50) = happyShift action_56
action_28 (9) = happyGoto action_54
action_28 (10) = happyGoto action_9
action_28 (11) = happyGoto action_10
action_28 (12) = happyGoto action_11
action_28 (13) = happyGoto action_55
action_28 (14) = happyGoto action_12
action_28 (19) = happyGoto action_13
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (21) = happyShift action_14
action_29 (23) = happyShift action_15
action_29 (25) = happyShift action_26
action_29 (26) = happyShift action_27
action_29 (27) = happyShift action_18
action_29 (29) = happyShift action_19
action_29 (34) = happyShift action_20
action_29 (37) = happyShift action_21
action_29 (38) = happyShift action_22
action_29 (42) = happyShift action_23
action_29 (49) = happyShift action_24
action_29 (9) = happyGoto action_53
action_29 (10) = happyGoto action_9
action_29 (11) = happyGoto action_10
action_29 (12) = happyGoto action_11
action_29 (14) = happyGoto action_12
action_29 (19) = happyGoto action_13
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (24) = happyShift action_52
action_30 (33) = happyShift action_34
action_30 (34) = happyShift action_35
action_30 (35) = happyShift action_36
action_30 (36) = happyShift action_37
action_30 (39) = happyShift action_38
action_30 (40) = happyShift action_39
action_30 (41) = happyShift action_40
action_30 (43) = happyShift action_41
action_30 (44) = happyShift action_42
action_30 (45) = happyShift action_43
action_30 (46) = happyShift action_44
action_30 (47) = happyShift action_45
action_30 (48) = happyShift action_46
action_30 (20) = happyGoto action_33
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (22) = happyShift action_51
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (33) = happyShift action_34
action_32 (34) = happyShift action_35
action_32 (35) = happyShift action_36
action_32 (36) = happyShift action_37
action_32 (39) = happyShift action_38
action_32 (40) = happyShift action_39
action_32 (41) = happyShift action_40
action_32 (43) = happyShift action_41
action_32 (44) = happyShift action_42
action_32 (45) = happyShift action_43
action_32 (46) = happyShift action_44
action_32 (47) = happyShift action_45
action_32 (48) = happyShift action_46
action_32 (20) = happyGoto action_33
action_32 _ = happyReduce_15

action_33 (21) = happyShift action_14
action_33 (23) = happyShift action_15
action_33 (25) = happyShift action_26
action_33 (26) = happyShift action_27
action_33 (27) = happyShift action_18
action_33 (29) = happyShift action_19
action_33 (34) = happyShift action_20
action_33 (37) = happyShift action_21
action_33 (38) = happyShift action_22
action_33 (42) = happyShift action_23
action_33 (49) = happyShift action_24
action_33 (9) = happyGoto action_50
action_33 (10) = happyGoto action_9
action_33 (11) = happyGoto action_10
action_33 (12) = happyGoto action_11
action_33 (14) = happyGoto action_12
action_33 (19) = happyGoto action_13
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_39

action_35 _ = happyReduce_40

action_36 _ = happyReduce_41

action_37 _ = happyReduce_42

action_38 _ = happyReduce_43

action_39 _ = happyReduce_46

action_40 _ = happyReduce_47

action_41 _ = happyReduce_48

action_42 _ = happyReduce_49

action_43 _ = happyReduce_50

action_44 _ = happyReduce_51

action_45 _ = happyReduce_44

action_46 _ = happyReduce_45

action_47 (31) = happyShift action_48
action_47 (49) = happyShift action_49
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (21) = happyShift action_14
action_48 (23) = happyShift action_15
action_48 (25) = happyShift action_26
action_48 (26) = happyShift action_27
action_48 (27) = happyShift action_18
action_48 (29) = happyShift action_19
action_48 (34) = happyShift action_20
action_48 (37) = happyShift action_21
action_48 (38) = happyShift action_22
action_48 (42) = happyShift action_23
action_48 (49) = happyShift action_24
action_48 (9) = happyGoto action_73
action_48 (10) = happyGoto action_9
action_48 (11) = happyGoto action_10
action_48 (12) = happyGoto action_11
action_48 (14) = happyGoto action_12
action_48 (19) = happyGoto action_13
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (25) = happyShift action_5
action_49 (26) = happyShift action_6
action_49 (50) = happyShift action_72
action_49 (7) = happyGoto action_69
action_49 (8) = happyGoto action_70
action_49 (15) = happyGoto action_71
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (33) = happyShift action_34
action_50 (34) = happyShift action_35
action_50 (35) = happyShift action_36
action_50 (36) = happyShift action_37
action_50 (39) = happyShift action_38
action_50 (40) = happyShift action_39
action_50 (41) = happyShift action_40
action_50 (43) = happyShift action_41
action_50 (44) = happyShift action_42
action_50 (45) = happyShift action_43
action_50 (46) = happyShift action_44
action_50 (47) = happyShift action_45
action_50 (48) = happyShift action_46
action_50 (20) = happyGoto action_33
action_50 _ = happyReduce_16

action_51 (21) = happyShift action_14
action_51 (23) = happyShift action_15
action_51 (25) = happyShift action_26
action_51 (26) = happyShift action_27
action_51 (27) = happyShift action_18
action_51 (29) = happyShift action_19
action_51 (34) = happyShift action_20
action_51 (37) = happyShift action_21
action_51 (38) = happyShift action_22
action_51 (42) = happyShift action_23
action_51 (49) = happyShift action_24
action_51 (9) = happyGoto action_68
action_51 (10) = happyGoto action_9
action_51 (11) = happyGoto action_10
action_51 (12) = happyGoto action_11
action_51 (14) = happyGoto action_12
action_51 (19) = happyGoto action_13
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (25) = happyShift action_26
action_52 (26) = happyShift action_27
action_52 (29) = happyShift action_66
action_52 (32) = happyShift action_67
action_52 (49) = happyShift action_24
action_52 (10) = happyGoto action_62
action_52 (11) = happyGoto action_10
action_52 (16) = happyGoto action_63
action_52 (17) = happyGoto action_64
action_52 (18) = happyGoto action_65
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (33) = happyShift action_34
action_53 (34) = happyShift action_35
action_53 (35) = happyShift action_36
action_53 (36) = happyShift action_37
action_53 (39) = happyShift action_38
action_53 (40) = happyShift action_39
action_53 (41) = happyShift action_40
action_53 (43) = happyShift action_41
action_53 (44) = happyShift action_42
action_53 (45) = happyShift action_43
action_53 (46) = happyShift action_44
action_53 (47) = happyShift action_45
action_53 (48) = happyShift action_46
action_53 (50) = happyShift action_61
action_53 (20) = happyGoto action_33
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (33) = happyShift action_34
action_54 (34) = happyShift action_35
action_54 (35) = happyShift action_36
action_54 (36) = happyShift action_37
action_54 (39) = happyShift action_38
action_54 (40) = happyShift action_39
action_54 (41) = happyShift action_40
action_54 (43) = happyShift action_41
action_54 (44) = happyShift action_42
action_54 (45) = happyShift action_43
action_54 (46) = happyShift action_44
action_54 (47) = happyShift action_45
action_54 (48) = happyShift action_46
action_54 (51) = happyShift action_60
action_54 (20) = happyGoto action_33
action_54 _ = happyReduce_23

action_55 (50) = happyShift action_59
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_22

action_57 (21) = happyShift action_14
action_57 (23) = happyShift action_15
action_57 (25) = happyShift action_26
action_57 (26) = happyShift action_27
action_57 (27) = happyShift action_18
action_57 (29) = happyShift action_19
action_57 (34) = happyShift action_20
action_57 (37) = happyShift action_21
action_57 (38) = happyShift action_22
action_57 (42) = happyShift action_23
action_57 (49) = happyShift action_24
action_57 (9) = happyGoto action_58
action_57 (10) = happyGoto action_9
action_57 (11) = happyGoto action_10
action_57 (12) = happyGoto action_11
action_57 (14) = happyGoto action_12
action_57 (19) = happyGoto action_13
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (33) = happyShift action_34
action_58 (34) = happyShift action_35
action_58 (35) = happyShift action_36
action_58 (36) = happyShift action_37
action_58 (39) = happyShift action_38
action_58 (40) = happyShift action_39
action_58 (41) = happyShift action_40
action_58 (43) = happyShift action_41
action_58 (44) = happyShift action_42
action_58 (45) = happyShift action_43
action_58 (46) = happyShift action_44
action_58 (47) = happyShift action_45
action_58 (48) = happyShift action_46
action_58 (50) = happyShift action_82
action_58 (20) = happyGoto action_33
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_21

action_60 (21) = happyShift action_14
action_60 (23) = happyShift action_15
action_60 (25) = happyShift action_26
action_60 (26) = happyShift action_27
action_60 (27) = happyShift action_18
action_60 (29) = happyShift action_19
action_60 (34) = happyShift action_20
action_60 (37) = happyShift action_21
action_60 (38) = happyShift action_22
action_60 (42) = happyShift action_23
action_60 (49) = happyShift action_24
action_60 (9) = happyGoto action_54
action_60 (10) = happyGoto action_9
action_60 (11) = happyGoto action_10
action_60 (12) = happyGoto action_11
action_60 (13) = happyGoto action_81
action_60 (14) = happyGoto action_12
action_60 (19) = happyGoto action_13
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (21) = happyShift action_14
action_61 (23) = happyShift action_15
action_61 (25) = happyShift action_16
action_61 (26) = happyShift action_17
action_61 (27) = happyShift action_18
action_61 (29) = happyShift action_19
action_61 (34) = happyShift action_20
action_61 (37) = happyShift action_21
action_61 (38) = happyShift action_22
action_61 (42) = happyShift action_23
action_61 (49) = happyShift action_24
action_61 (4) = happyGoto action_80
action_61 (5) = happyGoto action_2
action_61 (6) = happyGoto action_3
action_61 (9) = happyGoto action_8
action_61 (10) = happyGoto action_9
action_61 (11) = happyGoto action_10
action_61 (12) = happyGoto action_11
action_61 (14) = happyGoto action_12
action_61 (15) = happyGoto action_4
action_61 (19) = happyGoto action_13
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_32

action_63 _ = happyReduce_14

action_64 (25) = happyShift action_26
action_64 (26) = happyShift action_27
action_64 (29) = happyShift action_66
action_64 (32) = happyShift action_67
action_64 (49) = happyShift action_24
action_64 (10) = happyGoto action_62
action_64 (11) = happyGoto action_10
action_64 (16) = happyGoto action_79
action_64 (17) = happyGoto action_64
action_64 (18) = happyGoto action_65
action_64 _ = happyReduce_29

action_65 (30) = happyShift action_78
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_33

action_67 _ = happyReduce_34

action_68 (33) = happyShift action_34
action_68 (34) = happyShift action_35
action_68 (35) = happyShift action_36
action_68 (36) = happyShift action_37
action_68 (39) = happyShift action_38
action_68 (40) = happyShift action_39
action_68 (41) = happyShift action_40
action_68 (43) = happyShift action_41
action_68 (44) = happyShift action_42
action_68 (45) = happyShift action_43
action_68 (46) = happyShift action_44
action_68 (47) = happyShift action_45
action_68 (48) = happyShift action_46
action_68 (20) = happyGoto action_33
action_68 _ = happyReduce_13

action_69 (50) = happyShift action_77
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (51) = happyShift action_76
action_70 _ = happyReduce_7

action_71 (29) = happyShift action_75
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (21) = happyShift action_14
action_72 (23) = happyShift action_15
action_72 (25) = happyShift action_26
action_72 (26) = happyShift action_27
action_72 (27) = happyShift action_18
action_72 (29) = happyShift action_19
action_72 (34) = happyShift action_20
action_72 (37) = happyShift action_21
action_72 (38) = happyShift action_22
action_72 (42) = happyShift action_23
action_72 (49) = happyShift action_24
action_72 (9) = happyGoto action_74
action_72 (10) = happyGoto action_9
action_72 (11) = happyGoto action_10
action_72 (12) = happyGoto action_11
action_72 (14) = happyGoto action_12
action_72 (19) = happyGoto action_13
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (33) = happyShift action_34
action_73 (34) = happyShift action_35
action_73 (35) = happyShift action_36
action_73 (36) = happyShift action_37
action_73 (39) = happyShift action_38
action_73 (40) = happyShift action_39
action_73 (41) = happyShift action_40
action_73 (43) = happyShift action_41
action_73 (44) = happyShift action_42
action_73 (45) = happyShift action_43
action_73 (46) = happyShift action_44
action_73 (47) = happyShift action_45
action_73 (48) = happyShift action_46
action_73 (20) = happyGoto action_33
action_73 _ = happyReduce_3

action_74 (33) = happyShift action_34
action_74 (34) = happyShift action_35
action_74 (35) = happyShift action_36
action_74 (36) = happyShift action_37
action_74 (39) = happyShift action_38
action_74 (40) = happyShift action_39
action_74 (41) = happyShift action_40
action_74 (43) = happyShift action_41
action_74 (44) = happyShift action_42
action_74 (45) = happyShift action_43
action_74 (46) = happyShift action_44
action_74 (47) = happyShift action_45
action_74 (48) = happyShift action_46
action_74 (20) = happyGoto action_33
action_74 _ = happyReduce_6

action_75 _ = happyReduce_9

action_76 (25) = happyShift action_5
action_76 (26) = happyShift action_6
action_76 (7) = happyGoto action_86
action_76 (8) = happyGoto action_70
action_76 (15) = happyGoto action_71
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (21) = happyShift action_14
action_77 (23) = happyShift action_15
action_77 (25) = happyShift action_26
action_77 (26) = happyShift action_27
action_77 (27) = happyShift action_18
action_77 (29) = happyShift action_19
action_77 (34) = happyShift action_20
action_77 (37) = happyShift action_21
action_77 (38) = happyShift action_22
action_77 (42) = happyShift action_23
action_77 (49) = happyShift action_24
action_77 (9) = happyGoto action_85
action_77 (10) = happyGoto action_9
action_77 (11) = happyGoto action_10
action_77 (12) = happyGoto action_11
action_77 (14) = happyGoto action_12
action_77 (19) = happyGoto action_13
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (21) = happyShift action_14
action_78 (23) = happyShift action_15
action_78 (25) = happyShift action_26
action_78 (26) = happyShift action_27
action_78 (27) = happyShift action_18
action_78 (29) = happyShift action_19
action_78 (34) = happyShift action_20
action_78 (37) = happyShift action_21
action_78 (38) = happyShift action_22
action_78 (42) = happyShift action_23
action_78 (49) = happyShift action_24
action_78 (9) = happyGoto action_84
action_78 (10) = happyGoto action_9
action_78 (11) = happyGoto action_10
action_78 (12) = happyGoto action_11
action_78 (14) = happyGoto action_12
action_78 (19) = happyGoto action_13
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_30

action_80 (28) = happyShift action_83
action_80 _ = happyReduce_25

action_81 _ = happyReduce_24

action_82 _ = happyReduce_20

action_83 (21) = happyShift action_14
action_83 (23) = happyShift action_15
action_83 (25) = happyShift action_16
action_83 (26) = happyShift action_17
action_83 (27) = happyShift action_18
action_83 (29) = happyShift action_19
action_83 (34) = happyShift action_20
action_83 (37) = happyShift action_21
action_83 (38) = happyShift action_22
action_83 (42) = happyShift action_23
action_83 (49) = happyShift action_24
action_83 (4) = happyGoto action_87
action_83 (5) = happyGoto action_2
action_83 (6) = happyGoto action_3
action_83 (9) = happyGoto action_8
action_83 (10) = happyGoto action_9
action_83 (11) = happyGoto action_10
action_83 (12) = happyGoto action_11
action_83 (14) = happyGoto action_12
action_83 (15) = happyGoto action_4
action_83 (19) = happyGoto action_13
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (33) = happyShift action_34
action_84 (34) = happyShift action_35
action_84 (35) = happyShift action_36
action_84 (36) = happyShift action_37
action_84 (39) = happyShift action_38
action_84 (40) = happyShift action_39
action_84 (41) = happyShift action_40
action_84 (43) = happyShift action_41
action_84 (44) = happyShift action_42
action_84 (45) = happyShift action_43
action_84 (46) = happyShift action_44
action_84 (47) = happyShift action_45
action_84 (48) = happyShift action_46
action_84 (20) = happyGoto action_33
action_84 _ = happyReduce_31

action_85 (33) = happyShift action_34
action_85 (34) = happyShift action_35
action_85 (35) = happyShift action_36
action_85 (36) = happyShift action_37
action_85 (39) = happyShift action_38
action_85 (40) = happyShift action_39
action_85 (41) = happyShift action_40
action_85 (43) = happyShift action_41
action_85 (44) = happyShift action_42
action_85 (45) = happyShift action_43
action_85 (46) = happyShift action_44
action_85 (47) = happyShift action_45
action_85 (48) = happyShift action_46
action_85 (20) = happyGoto action_33
action_85 _ = happyReduce_5

action_86 _ = happyReduce_8

action_87 _ = happyReduce_26

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Lang.Def happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn4
		 (Lang.Expr happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Lang.Definition happy_var_2 [] happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happyReduce 6 6 happyReduction_5
happyReduction_5 ((HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Lang.Definition happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 5 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Lang.Definition happy_var_2 [] happy_var_5
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  7 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  8 happyReduction_9
happyReduction_9 (HappyTerminal happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn8
		 (Lang.Param happy_var_1 happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  9 happyReduction_10
happyReduction_10 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (Lang.Value happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  9 happyReduction_11
happyReduction_11 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happyReduce 4 9 happyReduction_13
happyReduction_13 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Lang.Let happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 9 happyReduction_14
happyReduction_14 ((HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Lang.CaseOf happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_2  9 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn9
		 (Lang.UnaryOp happy_var_1 happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  9 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Lang.BinaryOp happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyTerminal (Lexer.Int happy_var_1))
	 =  HappyAbsSyn10
		 (Lang.IntValue happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  10 happyReduction_18
happyReduction_18 (HappyTerminal (Lexer.Bool happy_var_1))
	 =  HappyAbsSyn10
		 (Lang.BoolValue happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  10 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happyReduce 5 11 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Lang.TupleValue happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 12 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Lang.App happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 _
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn12
		 (Lang.App happy_var_1 []
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  13 happyReduction_23
happyReduction_23 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1:happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 5 14 happyReduction_25
happyReduction_25 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Lang.If happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 7 14 happyReduction_26
happyReduction_26 ((HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Lang.IfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_1  15 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn15
		 (Lang.TInt
	)

happyReduce_28 = happySpecReduce_1  15 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn15
		 (Lang.TBool
	)

happyReduce_29 = happySpecReduce_1  16 happyReduction_29
happyReduction_29 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  16 happyReduction_30
happyReduction_30 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1:happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  17 happyReduction_31
happyReduction_31 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 ((happy_var_1, happy_var_3)
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  18 happyReduction_32
happyReduction_32 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn18
		 (Lang.PValue happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  18 happyReduction_33
happyReduction_33 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn18
		 (Lang.PVar happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  18 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn18
		 (Lang.PWildcard
	)

happyReduce_35 = happySpecReduce_1  19 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn19
		 (Lang.Operator Lang.Arithmetic "-"
	)

happyReduce_36 = happySpecReduce_1  19 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn19
		 (Lang.Operator Lang.Arithmetic "++"
	)

happyReduce_37 = happySpecReduce_1  19 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn19
		 (Lang.Operator Lang.Arithmetic "--"
	)

happyReduce_38 = happySpecReduce_1  19 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn19
		 (Lang.Operator Lang.Logical "!"
	)

happyReduce_39 = happySpecReduce_1  20 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Arithmetic "+"
	)

happyReduce_40 = happySpecReduce_1  20 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Arithmetic "-"
	)

happyReduce_41 = happySpecReduce_1  20 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Arithmetic "*"
	)

happyReduce_42 = happySpecReduce_1  20 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Arithmetic "/"
	)

happyReduce_43 = happySpecReduce_1  20 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Arithmetic "%"
	)

happyReduce_44 = happySpecReduce_1  20 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Logical "&&"
	)

happyReduce_45 = happySpecReduce_1  20 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Logical "||"
	)

happyReduce_46 = happySpecReduce_1  20 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Comparaison "=="
	)

happyReduce_47 = happySpecReduce_1  20 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Comparaison "!="
	)

happyReduce_48 = happySpecReduce_1  20 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Relational "<"
	)

happyReduce_49 = happySpecReduce_1  20 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Relational "<="
	)

happyReduce_50 = happySpecReduce_1  20 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Relational ">"
	)

happyReduce_51 = happySpecReduce_1  20 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn20
		 (Lang.Operator Lang.Relational ">="
	)

happyNewToken action sts stk [] =
	action 52 52 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Lexer.Let -> cont 21;
	Lexer.In -> cont 22;
	Lexer.Case -> cont 23;
	Lexer.Of -> cont 24;
	Lexer.Int happy_dollar_dollar -> cont 25;
	Lexer.Bool happy_dollar_dollar -> cont 26;
	Lexer.If -> cont 27;
	Lexer.Else -> cont 28;
	Lexer.Name -> cont 29;
	Lexer.Arrow -> cont 30;
	Lexer.Affect -> cont 31;
	Lexer.Wildcard -> cont 32;
	Lexer.Plus -> cont 33;
	Lexer.Minus -> cont 34;
	Lexer.Star -> cont 35;
	Lexer.Slash -> cont 36;
	Lexer.PlusPlus -> cont 37;
	Lexer.MinusMinus -> cont 38;
	Lexer.Mod -> cont 39;
	Lexer.Equals -> cont 40;
	Lexer.NotEquals -> cont 41;
	Lexer.Not -> cont 42;
	Lexer.Less -> cont 43;
	Lexer.LessEquals -> cont 44;
	Lexer.More -> cont 45;
	Lexer.MoreEquals -> cont 46;
	Lexer.And -> cont 47;
	Lexer.Or -> cont 48;
	Lexer.LPar -> cont 49;
	Lexer.RPar -> cont 50;
	Lexer.Comma -> cont 51;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 52 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError x = error ("Parse error: " ++ show x)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
