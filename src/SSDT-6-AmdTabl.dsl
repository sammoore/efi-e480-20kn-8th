/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of origin/SSDT-6-AmdTabl.aml, Sat Sep 21 22:17:06 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000005C4 (1476)
 *     Revision         0x01
 *     Checksum         0x5F
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "AmdTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 1, "LENOVO", "AmdTabl", 0x00001000)
{
    External (_SB_.LID_._LID, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.GFX0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC__.ADSL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC__.DGFQ, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.RP01.PCMR, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.RP01.PEGP._OFF, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.RP01.PEGP._ON_, MethodObj)    // 0 Arguments (from opcode)
    External (AMDA, UnknownObj)    // (from opcode)
    External (DTGP, UnknownObj)    // (from opcode)
    External (OSYS, UnknownObj)    // (from opcode)

    Scope (\_SB.PCI0.GFX0)
    {
        Name (ATPB, Buffer (0x0100){})
        CreateWordField (ATPB, Zero, SSZE)
        CreateWordField (ATPB, 0x02, VERN)
        CreateDWordField (ATPB, 0x02, VMSK)
        CreateDWordField (ATPB, 0x04, SFUN)
        CreateDWordField (ATPB, 0x06, FLGS)
        Method (ATPX, 2, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Store (0x08, SSZE)
                Store (One, VERN)
                Store (0x33, SFUN)
                Return (ATPB)
            }

            If (LEqual (Arg0, One))
            {
                Store (0x0A, SSZE)
                If (LGreaterEqual (OSYS, 0x07DF))
                {
                    Store (0x4680, VMSK)
                    Store (0x4680, FLGS)
                }
                Else
                {
                    Store (0x0680, VMSK)
                    Store (0x0680, FLGS)
                }

                Return (ATPB)
            }

            If (LEqual (Arg0, 0x02))
            {
                CreateByteField (Arg1, 0x02, PWST)
                Store (PWST, Local0)
                And (Local0, One, Local0)
                If (Local0)
                {
                    Store (0x07, \_SB.PCI0.RP01.PCMR)
                    \_SB.PCI0.RP01.PEGP._ON ()
                }
                Else
                {
                    \_SB.PCI0.RP01.PEGP._OFF ()
                }
            }

            If (LEqual (Arg0, 0x05)){}
            If (LEqual (Arg0, 0x06)){}
        }

        OperationRegion (NVHM, SystemMemory, \AMDA, 0x00010004)
        Field (NVHM, AnyAcc, NoLock, Preserve)
        {
            SROM,   32, 
            IDX0,   262144, 
            IDX1,   262144
        }

        Method (ATRM, 2, Serialized)
        {
            If (LGreaterEqual (Arg0, 0x8000))
            {
                Return (GETB (Subtract (Arg0, 0x8000), Arg1, IDX1))
            }

            If (LGreater (Add (Arg0, Arg1), 0x8000))
            {
                Subtract (0x8000, Arg0, Local0)
                Subtract (Arg1, Local0, Local1)
                Store (GETB (Arg0, Local0, IDX0), Local3)
                Store (GETB (Zero, Local1, IDX1), Local4)
                Concatenate (Local3, Local4, Local5)
                Return (Local5)
            }

            Return (GETB (Arg0, Arg1, IDX0))
        }

        Method (GETB, 3, Serialized)
        {
            Multiply (Arg0, 0x08, Local0)
            Multiply (Arg1, 0x08, Local1)
            CreateField (Arg2, Local0, Local1, TBF3)
            Return (TBF3)
        }

        CreateDWordField (ATPB, 0x04, SNTF)
        CreateDWordField (ATPB, 0x06, IFLG)
        CreateDWordField (ATPB, 0x08, ISFN)
        CreateWordField (ATPB, 0x0A, IFPW)
        Name (SWRL, Buffer (0x07)
        {
             0x01, 0x02, 0x08, 0x80, 0x03, 0x09, 0x81       
        })
        Method (ATIF, 2, NotSerialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Store (0x0C, SSZE)
                Store (One, VERN)
                Store (0x05, SNTF)
                Store (0x07, ISFN)
                Return (ATPB)
            }

            If (LEqual (Arg0, One))
            {
                Store (0x0A, SSZE)
                Store (0x03, VMSK)
                Store (One, IFLG)
                Return (ATPB)
            }

            If (LEqual (Arg0, 0x02))
            {
                CreateByteField (ATPB, 0x07, TSTG)
                CreateByteField (ATPB, 0x08, TSID)
                Store (0x0C, SSZE)
                Store (0x05, VMSK)
                Store (Zero, IFLG)
                Store (Zero, IFPW)
                If (LEqual (DTGP, Zero))
                {
                    If (LEqual (\_SB.PCI0.LPCB.EC.ADSL, One))
                    {
                        Store (0x02, TSTG)
                        Store (Zero, TSID)
                    }

                    If (LEqual (\_SB.PCI0.LPCB.EC.ADSL, Zero))
                    {
                        Store (0x02, TSTG)
                        Store (Zero, TSID)
                    }
                }
                ElseIf (LEqual (DTGP, One))
                {
                    If (LEqual (\_SB.PCI0.LPCB.EC.ADSL, One))
                    {
                        Store (0x02, TSTG)
                        Store (0x02, TSID)
                    }

                    If (LEqual (\_SB.PCI0.LPCB.EC.ADSL, Zero))
                    {
                        Store (0x02, TSTG)
                        Store (Zero, TSID)
                    }
                }

                If (LEqual (\_SB.PCI0.LPCB.EC.DGFQ, Zero))
                {
                    Store (0x02, TSTG)
                    Store (Zero, TSID)
                }

                If (LEqual (\_SB.PCI0.LPCB.EC.DGFQ, One))
                {
                    Store (0x02, TSTG)
                    Store (One, TSID)
                }

                If (LEqual (\_SB.PCI0.LPCB.EC.DGFQ, 0x02))
                {
                    Store (0x02, TSTG)
                    Store (0x02, TSID)
                }

                If (LEqual (\_SB.PCI0.LPCB.EC.DGFQ, 0x03))
                {
                    Store (0x02, TSTG)
                    Store (0x03, TSID)
                }

                If (LEqual (\_SB.PCI0.LPCB.EC.DGFQ, 0x04))
                {
                    Store (0x02, TSTG)
                    Store (0x04, TSID)
                }

                If (LEqual (\_SB.PCI0.LPCB.EC.DGFQ, 0x05))
                {
                    Store (0x02, TSTG)
                    Store (0x05, TSID)
                }

                Return (ATPB)
            }

            If (LEqual (Arg0, 0x03))
            {
                CreateWordField (Arg1, 0x02, SELD)
                CreateWordField (Arg1, 0x04, COND)
                Store (0x07, Local1)
                Store (Zero, Local3)
                While (Local1)
                {
                    Decrement (Local1)
                    Store (DerefOf (Index (SWRL, Local1)), Local2)
                    If (LEqual (SELD, Local2))
                    {
                        Store (One, Local3)
                        Break
                    }
                }

                If (LEqual (Zero, Local3))
                {
                    Store (0x06, Local1)
                }

                Store (One, Local0)
                Store (0x06, Local3)
                Store (COND, Local4)
                If (\_SB.LID._LID ())
                {
                    Increment (Local4)
                }

                While (Local3)
                {
                    Decrement (Local3)
                    Increment (Local1)
                    If (LGreaterEqual (Local1, 0x07))
                    {
                        Store (Zero, Local1)
                    }

                    Store (DerefOf (Index (SWRL, Local1)), Local2)
                    If (LEqual (And (Local4, Local2), Local2))
                    {
                        Store (Local2, Local0)
                        Break
                    }
                }

                Store (0x04, SSZE)
                Store (Local0, VERN)
                Return (ATPB)
            }
        }
    }
}

