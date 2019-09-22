/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of origin/SSDT-8-SgUlx.aml, Sat Sep 21 22:17:06 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000351 (849)
 *     Revision         0x02
 *     Checksum         0x20
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "SgUlx"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "LENOVO", "SgUlx", 0x00001000)
{
    External (_SB_.PCI0.BADR, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.BARD, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.CMDS, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.CMR1, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.HDID, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.HGOF, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.HGON, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.HVID, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.PCMR, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.PWRS, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.RP01, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP01.PEGP, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.SDI1, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.SVI1, UnknownObj)    // (from opcode)
    External (GPRW, MethodObj)    // 2 Arguments (from opcode)
    External (OSYS, UnknownObj)    // (from opcode)

    Scope (\_SB.PCI0.RP01)
    {
        PowerResource (PC01, 0x00, 0x0000)
        {
            Name (_STA, One)  // _STA: Status
            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                If (LNotEqual (OSYS, 0x07D9))
                {
                    Store (0x07, \_SB.PCI0.PCMR)
                    Store (0x00, \_SB.PCI0.PWRS)
                    Sleep (0x10)
                    \_SB.PCI0.HGON (0x01)
                    Store (One, _STA)
                }
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                If (LNotEqual (OSYS, 0x07D9))
                {
                    \_SB.PCI0.HGOF (0x01)
                    Store (Zero, _STA)
                }
            }
        }

        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            PC01
        })
        Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
        {
            PC01
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            PC01
        })
        Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
        {
            Return (0x04)
        }

        Device (PEGP)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x69, 0x04))
            }
        }

        Device (PEGA)
        {
            Name (_ADR, 0x01)  // _ADR: Address
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x69, 0x04))
            }
        }
    }

    Scope (\_SB.PCI0.RP01.PEGP)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (0x00, \_SB.PCI0.RP01.PEGP._ADR)
            Store (0x07, \_SB.PCI0.CMR1)
            Store (0x07, \_SB.PCI0.CMDS)
            Store (\_SB.PCI0.SVI1, \_SB.PCI0.HVID)
            Store (\_SB.PCI0.SDI1, \_SB.PCI0.HDID)
            Store (\_SB.PCI0.BADR, \_SB.PCI0.BARD)
        }

        Method (_ON, 0, Serialized)  // _ON_: Power On
        {
            \_SB.PCI0.HGON (0x01)
            Notify (\_SB.PCI0.RP01, 0x00)
            Return (Zero)
        }

        Method (_OFF, 0, Serialized)  // _OFF: Power Off
        {
            \_SB.PCI0.HGOF (0x01)
            Notify (\_SB.PCI0.RP01, 0x00)
            Return (Zero)
        }
    }
}

