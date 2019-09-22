/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of origin/SSDT-7-SgPch.aml, Sat Sep 21 22:17:06 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000005AD (1453)
 *     Revision         0x02
 *     Checksum         0x34
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "SgPch"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "LENOVO", "SgPch", 0x00001000)
{
    External (_SB_.GGIV, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.D8XH, MethodObj)    // 2 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.EC__.GATY, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.RP01._ADR, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.SGOV, MethodObj)    // 2 Arguments (from opcode)
    External (EECP, UnknownObj)    // (from opcode)
    External (RPA1, UnknownObj)    // (from opcode)
    External (XBAS, UnknownObj)    // (from opcode)

    Scope (\_SB.PCI0)
    {
        Name (IVID, 0xFFFF)
        Name (ELCT, 0x00)
        Name (HVID, 0x00)
        Name (HDID, 0x00)
        Name (TCNT, 0x00)
        Name (LDLY, 0x64)
        Name (RPIX, 0x00)
        Name (CMDS, 0x00)
        Name (ONOF, 0x01)
        OperationRegion (RPC1, SystemMemory, Add (Add (\XBAS, ShiftLeft (ShiftRight (And (\_SB.PCI0.RP01._ADR (), 0x00FF0000), 0x10), 0x0F)), ShiftLeft (And (\RPA1, 0x0F), 0x0C)), 0x1000)
        Field (RPC1, AnyAcc, NoLock, Preserve)
        {
            PVI1,   16, 
            PDI1,   16, 
            PCMR,   8, 
            Offset (0x18), 
            PRB1,   8, 
            SCB1,   8, 
            Offset (0x50), 
            ASP1,   2, 
                ,   2, 
            LKD1,   1, 
            Offset (0xA4), 
            PWRS,   8, 
            Offset (0x328), 
                ,   19, 
            LKS1,   4
        }

        OperationRegion (RTP1, SystemMemory, Add (\XBAS, ShiftLeft (SCB1, 0x14)), 0xF0)
        Field (RTP1, AnyAcc, Lock, Preserve)
        {
            DVI1,   16, 
            Offset (0x04), 
            CMR1,   8, 
            Offset (0x0B), 
            CBC1,   8, 
            Offset (0x2C), 
            SVI1,   16, 
            SDI1,   16
        }

        OperationRegion (PCA1, SystemMemory, Add (Add (\XBAS, ShiftLeft (SCB1, 0x14)), \EECP), 0x14)
        Field (PCA1, AnyAcc, NoLock, Preserve)
        {
            Offset (0x10), 
            LCT1,   16
        }

        OperationRegion (PCB1, SystemMemory, Add (Add (Add (\XBAS, ShiftLeft (SCB1, 0x14)), 0x1000), \EECP), 0x14)
        Field (PCB1, AnyAcc, NoLock, Preserve)
        {
            Offset (0x10), 
            LCTY,   16
        }

        OperationRegion (PCIS, SystemMemory, Add (\XBAS, ShiftLeft (\_SB.PCI0.SCB1, 0x14)), 0x0500)
        Field (PCIS, AnyAcc, Lock, Preserve)
        {
            Offset (0x24), 
            BADR,   32, 
            Offset (0x4C), 
            SVIW,   32, 
            Offset (0x488), 
                ,   25, 
            MLTR,   1
        }

        Name (ACNT, 0x00)
        Name (ADLT, 0x14)
        Name (BARD, 0x00)
        Method (HGON, 1, Serialized)
        {
            D8XH (0x00, 0x33)
            Store (Arg0, RPIX)
            If (LEqual (CCHK (0x01, RPIX), 0x00))
            {
                Return (Zero)
            }

            Store (One, ONOF)
            \_SB.SGOV (0x02020011, 0x01)
            While (LLess (ACNT, ADLT))
            {
                If (LEqual (\_SB.GGIV (0x02020012), 0x01))
                {
                    Break
                }

                Sleep (0x01)
                Add (ACNT, 0x01, ACNT)
            }

            Sleep (0x012C)
            \_SB.SGOV (0x02020013, 0x01)
            Sleep (0x01)
            If (LEqual (RPIX, 0x01))
            {
                Store (0x00, LKD1)
            }

            Store (0x00, TCNT)
            While (LLess (TCNT, LDLY))
            {
                If (LEqual (RPIX, 0x01))
                {
                    If (LGreaterEqual (LKS1, 0x07))
                    {
                        Break
                    }
                }

                Sleep (0x10)
                Add (TCNT, 0x10, TCNT)
            }

            If (LGreaterEqual (TCNT, 0x64))
            {
                \_SB.PCI0.HGOF (0x01)
                Store (0x20, Local1)
                \_SB.SGOV (0x02020011, 0x01)
                While (Local1)
                {
                    If (LEqual (\_SB.GGIV (0x02020012), 0x01))
                    {
                        Break
                    }

                    Sleep (0x01)
                    Decrement (Local1)
                }

                \_SB.SGOV (0x02020013, 0x01)
                Sleep (0x01)
                If (LEqual (RPIX, 0x01))
                {
                    Store (0x00, LKD1)
                }

                Store (0x00, TCNT)
                While (LLess (TCNT, LDLY))
                {
                    If (LEqual (RPIX, 0x01))
                    {
                        If (LGreaterEqual (LKS1, 0x07))
                        {
                            Break
                        }
                    }

                    Sleep (0x10)
                    Add (TCNT, 0x10, TCNT)
                }
            }

            Store (Or (ShiftLeft (HDID, 0x10), HVID), SVIW)
            Store (BARD, BADR)
            Store (CMDS, CMR1)
            Store (0x00, MLTR)
            If (LEqual (RPIX, 0x01))
            {
                Or (And (ELCT, 0x43), And (LCT1, 0xFFBC), LCT1)
            }

            Store (0x02, \_SB.PCI0.LPCB.EC.GATY)
            D8XH (0x00, 0x44)
            Return (Zero)
        }

        Method (HGOF, 1, Serialized)
        {
            D8XH (0x00, 0x55)
            Store (Arg0, RPIX)
            If (LEqual (CCHK (0x00, RPIX), 0x00))
            {
                Return (Zero)
            }

            Store (0x00, ONOF)
            If (LEqual (RPIX, 0x01))
            {
                Store (LCT1, ELCT)
                Store (CMR1, CMDS)
                Store (0x01, LKD1)
            }

            Store (0x00, TCNT)
            While (LLess (TCNT, LDLY))
            {
                If (LEqual (RPIX, 0x01))
                {
                    If (LGreaterEqual (LKS1, 0x00))
                    {
                        Break
                    }
                }

                Sleep (0x10)
                Add (TCNT, 0x10, TCNT)
            }

            \_SB.SGOV (0x02020011, 0x00)
            Sleep (0x01)
            While (LLess (ACNT, ADLT))
            {
                If (LEqual (\_SB.GGIV (0x02020012), 0x00))
                {
                    Sleep (0x01)
                    Break
                }

                Sleep (0x01)
                Add (ACNT, 0x01, ACNT)
            }

            Sleep (0x6E)
            \_SB.SGOV (0x02020013, 0x00)
            Store (0x00, \_SB.PCI0.LPCB.EC.GATY)
            D8XH (0x00, 0x66)
            Return (Zero)
        }

        Method (CCHK, 2, NotSerialized)
        {
            If (LEqual (Arg1, 0x01))
            {
                If (LEqual (PVI1, IVID))
                {
                    Return (0x00)
                }
            }

            If (LEqual (Arg0, 0x00))
            {
                If (LEqual (ONOF, 0x00))
                {
                    Return (0x00)
                }
            }
            ElseIf (LEqual (Arg0, 0x01))
            {
                If (LEqual (ONOF, 0x01))
                {
                    Return (0x00)
                }
            }

            Return (0x01)
        }
    }
}

