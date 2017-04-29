/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/RSZA/project/mod_I2C.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};
static int ng3[] = {2, 0};
static const char *ng4 = "state: %d";
static unsigned int ng5[] = {0U, 1U};
static unsigned int ng6[] = {0U, 0U};



static void Always_69_0(char *t0)
{
    char t14[8];
    char t18[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;

LAB0:    t1 = (t0 + 6208U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 7024);
    *((int *)t2) = 1;
    t3 = (t0 + 6240);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(70, ng0);

LAB5:    xsi_set_current_line(74, ng0);
    t4 = (t0 + 3048);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = (t0 + 3208);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = xsi_vlog_unsigned_case_compare(t6, 4, t9, 4);
    if (t10 == 1)
        goto LAB7;

LAB8:    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t10 = xsi_vlog_unsigned_case_compare(t6, 4, t4, 4);
    if (t10 == 1)
        goto LAB9;

LAB10:    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t10 = xsi_vlog_unsigned_case_compare(t6, 4, t4, 4);
    if (t10 == 1)
        goto LAB11;

LAB12:
LAB13:    xsi_set_current_line(137, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng4, 2, t0, (char)118, t4, 4);
    goto LAB2;

LAB7:    xsi_set_current_line(76, ng0);

LAB14:    xsi_set_current_line(77, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1368U);
    t13 = *((char **)t12);
    t12 = (t0 + 1328U);
    t15 = (t12 + 72U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng2)));
    xsi_vlog_generic_get_index_select_value(t14, 32, t13, t16, 2, t17, 32, 1);
    memset(t18, 0, 8);
    t19 = (t11 + 4);
    t20 = (t14 + 4);
    t21 = *((unsigned int *)t11);
    t22 = *((unsigned int *)t14);
    t23 = (t21 ^ t22);
    t24 = *((unsigned int *)t19);
    t25 = *((unsigned int *)t20);
    t26 = (t24 ^ t25);
    t27 = (t23 | t26);
    t28 = *((unsigned int *)t19);
    t29 = *((unsigned int *)t20);
    t30 = (t28 | t29);
    t31 = (~(t30));
    t32 = (t27 & t31);
    if (t32 != 0)
        goto LAB18;

LAB15:    if (t30 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t18) = 1;

LAB18:    t34 = (t18 + 4);
    t35 = *((unsigned int *)t34);
    t36 = (~(t35));
    t37 = *((unsigned int *)t18);
    t38 = (t37 & t36);
    t39 = (t38 != 0);
    if (t39 > 0)
        goto LAB19;

LAB20:
LAB21:    goto LAB13;

LAB9:    xsi_set_current_line(97, ng0);

LAB32:    xsi_set_current_line(98, ng0);
    t5 = ((char*)((ng2)));
    t7 = (t0 + 2568);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 1);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 5288);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5128);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memset(t14, 0, 8);
    t9 = (t4 + 4);
    t11 = (t8 + 4);
    t21 = *((unsigned int *)t4);
    t22 = *((unsigned int *)t8);
    t23 = (t21 ^ t22);
    t24 = *((unsigned int *)t9);
    t25 = *((unsigned int *)t11);
    t26 = (t24 ^ t25);
    t27 = (t23 | t26);
    t28 = *((unsigned int *)t9);
    t29 = *((unsigned int *)t11);
    t30 = (t28 | t29);
    t31 = (~(t30));
    t32 = (t27 & t31);
    if (t32 != 0)
        goto LAB36;

LAB33:    if (t30 != 0)
        goto LAB35;

LAB34:    *((unsigned int *)t14) = 1;

LAB36:    t13 = (t14 + 4);
    t35 = *((unsigned int *)t13);
    t36 = (~(t35));
    t37 = *((unsigned int *)t14);
    t38 = (t37 & t36);
    t39 = (t38 != 0);
    if (t39 > 0)
        goto LAB37;

LAB38:    xsi_set_current_line(109, ng0);

LAB47:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 5288);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 32, t4, 8, t5, 32);
    t7 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t7, t14, 0, 0, 8, 0LL);

LAB39:    goto LAB13;

LAB11:    xsi_set_current_line(115, ng0);

LAB48:    xsi_set_current_line(116, ng0);
    t5 = (t0 + 5288);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 5128);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memset(t14, 0, 8);
    t13 = (t8 + 4);
    t15 = (t12 + 4);
    t21 = *((unsigned int *)t8);
    t22 = *((unsigned int *)t12);
    t23 = (t21 ^ t22);
    t24 = *((unsigned int *)t13);
    t25 = *((unsigned int *)t15);
    t26 = (t24 ^ t25);
    t27 = (t23 | t26);
    t28 = *((unsigned int *)t13);
    t29 = *((unsigned int *)t15);
    t30 = (t28 | t29);
    t31 = (~(t30));
    t32 = (t27 & t31);
    if (t32 != 0)
        goto LAB52;

LAB49:    if (t30 != 0)
        goto LAB51;

LAB50:    *((unsigned int *)t14) = 1;

LAB52:    t17 = (t14 + 4);
    t35 = *((unsigned int *)t17);
    t36 = (~(t35));
    t37 = *((unsigned int *)t14);
    t38 = (t37 & t36);
    t39 = (t38 != 0);
    if (t39 > 0)
        goto LAB53;

LAB54:    xsi_set_current_line(123, ng0);

LAB63:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 5288);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 32, t4, 8, t5, 32);
    t7 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t7, t14, 0, 0, 8, 0LL);

LAB55:    goto LAB13;

LAB17:    t33 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB18;

LAB19:    xsi_set_current_line(78, ng0);

LAB22:    xsi_set_current_line(79, ng0);
    t40 = ((char*)((ng2)));
    t41 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t41, t40, 0, 0, 1, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t14, 0, 8);
    t2 = (t14 + 4);
    t4 = (t3 + 4);
    t21 = *((unsigned int *)t3);
    t22 = (t21 >> 3);
    t23 = (t22 & 1);
    *((unsigned int *)t14) = t23;
    t24 = *((unsigned int *)t4);
    t25 = (t24 >> 3);
    t26 = (t25 & 1);
    *((unsigned int *)t2) = t26;
    t5 = (t0 + 4648);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memset(t18, 0, 8);
    t9 = (t14 + 4);
    t11 = (t8 + 4);
    t27 = *((unsigned int *)t14);
    t28 = *((unsigned int *)t8);
    t29 = (t27 ^ t28);
    t30 = *((unsigned int *)t9);
    t31 = *((unsigned int *)t11);
    t32 = (t30 ^ t31);
    t35 = (t29 | t32);
    t36 = *((unsigned int *)t9);
    t37 = *((unsigned int *)t11);
    t38 = (t36 | t37);
    t39 = (~(t38));
    t42 = (t35 & t39);
    if (t42 != 0)
        goto LAB26;

LAB23:    if (t38 != 0)
        goto LAB25;

LAB24:    *((unsigned int *)t18) = 1;

LAB26:    t13 = (t18 + 4);
    t43 = *((unsigned int *)t13);
    t44 = (~(t43));
    t45 = *((unsigned int *)t18);
    t46 = (t45 & t44);
    t47 = (t46 != 0);
    if (t47 > 0)
        goto LAB27;

LAB28:    xsi_set_current_line(87, ng0);

LAB31:    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB29:    xsi_set_current_line(91, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    goto LAB21;

LAB25:    t12 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB26;

LAB27:    xsi_set_current_line(83, ng0);

LAB30:    xsi_set_current_line(84, ng0);
    t15 = ((char*)((ng3)));
    t16 = (t0 + 5128);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 8, 0LL);
    goto LAB29;

LAB35:    t12 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB36;

LAB37:    xsi_set_current_line(101, ng0);

LAB40:    xsi_set_current_line(102, ng0);
    t15 = ((char*)((ng2)));
    t16 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 8, 0LL);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t14, 0, 8);
    t5 = (t4 + 4);
    t21 = *((unsigned int *)t5);
    t22 = (~(t21));
    t23 = *((unsigned int *)t4);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB44;

LAB42:    if (*((unsigned int *)t5) == 0)
        goto LAB41;

LAB43:    t7 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t7) = 1;

LAB44:    t8 = (t14 + 4);
    t9 = (t4 + 4);
    t26 = *((unsigned int *)t4);
    t27 = (~(t26));
    *((unsigned int *)t14) = t27;
    *((unsigned int *)t8) = 0;
    if (*((unsigned int *)t9) != 0)
        goto LAB46;

LAB45:    t32 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t32 & 1U);
    t35 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t35 & 1U);
    t11 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t11, t14, 0, 0, 1, 0LL);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3048);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);
    goto LAB39;

LAB41:    *((unsigned int *)t14) = 1;
    goto LAB44;

LAB46:    t28 = *((unsigned int *)t14);
    t29 = *((unsigned int *)t9);
    *((unsigned int *)t14) = (t28 | t29);
    t30 = *((unsigned int *)t8);
    t31 = *((unsigned int *)t9);
    *((unsigned int *)t8) = (t30 | t31);
    goto LAB45;

LAB51:    t16 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB52;

LAB53:    xsi_set_current_line(117, ng0);

LAB56:    xsi_set_current_line(118, ng0);
    t19 = ((char*)((ng2)));
    t20 = (t0 + 5288);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 8, 0LL);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t14, 0, 8);
    t5 = (t4 + 4);
    t21 = *((unsigned int *)t5);
    t22 = (~(t21));
    t23 = *((unsigned int *)t4);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB60;

LAB58:    if (*((unsigned int *)t5) == 0)
        goto LAB57;

LAB59:    t7 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t7) = 1;

LAB60:    t8 = (t14 + 4);
    t9 = (t4 + 4);
    t26 = *((unsigned int *)t4);
    t27 = (~(t26));
    *((unsigned int *)t14) = t27;
    *((unsigned int *)t8) = 0;
    if (*((unsigned int *)t9) != 0)
        goto LAB62;

LAB61:    t32 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t32 & 1U);
    t35 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t35 & 1U);
    t11 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t11, t14, 0, 0, 1, 0LL);
    goto LAB55;

LAB57:    *((unsigned int *)t14) = 1;
    goto LAB60;

LAB62:    t28 = *((unsigned int *)t14);
    t29 = *((unsigned int *)t9);
    *((unsigned int *)t14) = (t28 | t29);
    t30 = *((unsigned int *)t8);
    t31 = *((unsigned int *)t9);
    *((unsigned int *)t8) = (t30 | t31);
    goto LAB61;

}

static void Cont_143_1(char *t0)
{
    char t3[8];
    char t4[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;

LAB0:    t1 = (t0 + 6456U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 2568);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t19 = *((unsigned int *)t4);
    t20 = (~(t19));
    t21 = *((unsigned int *)t14);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t23, 8);

LAB16:    t24 = (t0 + 7136);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memset(t28, 0, 8);
    t29 = 1U;
    t30 = t29;
    t31 = (t3 + 4);
    t32 = *((unsigned int *)t3);
    t29 = (t29 & t32);
    t33 = *((unsigned int *)t31);
    t30 = (t30 & t33);
    t34 = (t28 + 4);
    t35 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t35 | t29);
    t36 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t36 | t30);
    xsi_driver_vfirst_trans(t24, 0, 0);
    t37 = (t0 + 7040);
    *((int *)t37) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = ((char*)((ng5)));
    goto LAB9;

LAB10:    t23 = ((char*)((ng6)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t18, 1, t23, 1);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

}

static void Cont_144_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 6704U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(144, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7200);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 7056);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000003723755993_1414959689_init()
{
	static char *pe[] = {(void *)Always_69_0,(void *)Cont_143_1,(void *)Cont_144_2};
	xsi_register_didat("work_m_00000000003723755993_1414959689", "isim/mod_I2C_isim_beh.exe.sim/work/m_00000000003723755993_1414959689.didat");
	xsi_register_executes(pe);
}
