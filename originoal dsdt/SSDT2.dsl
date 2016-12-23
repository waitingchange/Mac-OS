/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161117-64
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT2.aml, Sun Dec 18 14:06:31 2016
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00002557 (9559)
 *     Revision         0x01
 *     Checksum         0xAB
 *     OEM ID           "NvdRef"
 *     OEM Table ID     "NvdTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120913 (538052883)
 */
DefinitionBlock ("", "SSDT", 1, "NvdRef", "NvdTabl", 0x00001000)
{
    External (_PR_.CPU0, ProcessorObj)
    External (_PR_.CPU0._PPC, MethodObj)    // 0 Arguments
    External (_PR_.CPU0._PSS, MethodObj)    // 0 Arguments
    External (_PR_.CPU0._PTC, UnknownObj)
    External (_PR_.CPU0._TSS, IntObj)
    External (_SB_.AC__.ADJP, MethodObj)    // 1 Arguments
    External (_SB_.AC__.CTMS, IntObj)
    External (_SB_.AC__.GPSF, IntObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.ADP_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.ECOK, IntObj)
    External (_SB_.PCI0.LPCB.EC__.EP12, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.GP12, IntObj)
    External (_SB_.PCI0.LPCB.EC__.TMP_, FieldUnitObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP._ADR, IntObj)
    External (_SB_.PCI0.PEG0.PEGP.PDID, FieldUnitObj)
    External (_SB_.PCI0.PEG1.PEGP, DeviceObj)
    External (_SB_.PCI0.PEG1.PEGP._ADR, IntObj)
    External (BRTL, FieldUnitObj)
    External (DSEN, FieldUnitObj)
    External (GPCF, FieldUnitObj)
    External (OSYS, FieldUnitObj)
    External (P80H, FieldUnitObj)
    External (PRM0, FieldUnitObj)
    External (PRM1, FieldUnitObj)
    External (SSMP, FieldUnitObj)

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        Name (LTRE, Zero)
        OperationRegion (NVHM, SystemMemory, 0x87B98A18, 0x01FA)
        Field (NVHM, DWordAcc, NoLock, Preserve)
        {
            LMID,   16, 
            LPID,   16, 
            LHOR,   16, 
            LVER,   16, 
            SDIL,   32, 
            SDOL,   32, 
            GACD,   16, 
            GATD,   16, 
            NACD,   16, 
            LDES,   8, 
            DHPE,   8, 
            DHPS,   8, 
            USPM,   8, 
            GPSP,   8, 
            TLPL,   8, 
            TLSN,   8, 
            DOSF,   8, 
            PWMF,   16, 
            MIND,   16, 
            MAXD,   16, 
            GTTP,   32, 
            GPSC,   32, 
            MXML,   32, 
            MXM3,   1600, 
            MX2L,   32, 
            MX32,   1600, 
            K3DL,   32, 
            K3DB,   400
        }

        OperationRegion (GPPB, PCI_Config, 0x00, 0x14)
        Field (GPPB, ByteAcc, NoLock, Preserve)
        {
            PBCI,   8, 
            PBNP,   8, 
            PBLS,   8, 
            PBCC,   8, 
            PBCR,   32, 
            PBDI,   32, 
            PBDO,   32, 
            PBMX,   32
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            _ADR = Zero
        }

        Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
        {
            DSEN = (Arg0 & 0x07)
            If ((DOSF == One))
            {
                DOSF = Zero
            }
        }

        Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
        {
            Name (TMP, Package (0x05)
            {
                0x8000A450, 
                0x80008340, 
                0x80008341, 
                0x80006320, 
                0x80006330
            })
            If (SDOL)
            {
                TMP [Zero] = SDOL /* \_SB_.PCI0.PEG0.PEGP.SDOL */
            }

            Return (TMP) /* \_SB_.PCI0.PEG0.PEGP._DOD.TMP_ */
        }

        Device (LCD0)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                If (SDIL)
                {
                    Return (SDIL) /* \_SB_.PCI0.PEG0.PEGP.SDIL */
                }

                Return (0x8000A450)
            }

            Name (BTOF, Zero)
            Method (MASK, 0, NotSerialized)
            {
                If ((BTOF == Zero))
                {
                    BTOF = (One << BTOF) /* \_SB_.PCI0.PEG0.PEGP.LCD0.BTOF */
                }

                Return (BTOF) /* \_SB_.PCI0.PEG0.PEGP.LCD0.BTOF */
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((GACD & MASK ()))
                {
                    Return (0x1F)
                }

                Return (0x1D)
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((NACD & MASK ()))
                {
                    Return (One)
                }

                Return (Zero)
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (((Arg0 & 0xC0000000) == 0xC0000000)) {}
            }

            Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
            {
                If ((OSYS < 0x07DC))
                {
                    Return (Package (0x0D)
                    {
                        0x50, 
                        0x1E, 
                        Zero, 
                        0x0A, 
                        0x14, 
                        0x1E, 
                        0x28, 
                        0x32, 
                        0x3C, 
                        0x46, 
                        0x50, 
                        0x5A, 
                        0x64
                    })
                }

                Return (Package (0x67)
                {
                    0x50, 
                    0x14, 
                    Zero, 
                    One, 
                    0x02, 
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0x0A, 
                    0x0B, 
                    0x0C, 
                    0x0D, 
                    0x0E, 
                    0x0F, 
                    0x10, 
                    0x11, 
                    0x12, 
                    0x13, 
                    0x14, 
                    0x15, 
                    0x16, 
                    0x17, 
                    0x18, 
                    0x19, 
                    0x1A, 
                    0x1B, 
                    0x1C, 
                    0x1D, 
                    0x1E, 
                    0x1F, 
                    0x20, 
                    0x21, 
                    0x22, 
                    0x23, 
                    0x24, 
                    0x25, 
                    0x26, 
                    0x27, 
                    0x28, 
                    0x29, 
                    0x2A, 
                    0x2B, 
                    0x2C, 
                    0x2D, 
                    0x2E, 
                    0x2F, 
                    0x30, 
                    0x31, 
                    0x32, 
                    0x33, 
                    0x34, 
                    0x35, 
                    0x36, 
                    0x37, 
                    0x38, 
                    0x39, 
                    0x3A, 
                    0x3B, 
                    0x3C, 
                    0x3D, 
                    0x3E, 
                    0x3F, 
                    0x40, 
                    0x41, 
                    0x42, 
                    0x43, 
                    0x44, 
                    0x45, 
                    0x46, 
                    0x47, 
                    0x48, 
                    0x49, 
                    0x4A, 
                    0x4B, 
                    0x4C, 
                    0x4D, 
                    0x4E, 
                    0x4F, 
                    0x50, 
                    0x51, 
                    0x52, 
                    0x53, 
                    0x54, 
                    0x55, 
                    0x56, 
                    0x57, 
                    0x58, 
                    0x59, 
                    0x5A, 
                    0x5B, 
                    0x5C, 
                    0x5D, 
                    0x5E, 
                    0x5F, 
                    0x60, 
                    0x61, 
                    0x62, 
                    0x63, 
                    0x64
                })
            }

            Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
            {
                BRTL = Arg0
                If ((PBCC == One))
                {
                    Local0 = Zero
                    PBDI = ((BRTL * 0x0A) << 0x08)
                    While ((Local0 < 0x03E8))
                    {
                        PBMX = One
                        PBCR = 0x86100000
                        Stall (0x64)
                        Local0++
                        If (((PBCR & 0xFF) == One))
                        {
                            Local0 = 0x03E8
                        }
                    }

                    PBCR = Zero
                    PBMX = Zero
                }

                P80H = BRTL /* External reference */
            }

            Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
            {
                Name (TMP2, Ones)
                If ((PBCC == One))
                {
                    If ((PBMX == Zero))
                    {
                        PBMX = 0x02
                        If ((PBMX == 0x02))
                        {
                            Local0 = Zero
                            While (((PBCR & 0x02) && (Local0 < 0x0A)))
                            {
                                Local0++
                                Sleep (One)
                            }

                            If (((PBCR & 0x02) == Zero))
                            {
                                PBDI = One
                                PBCR = 0x85100000
                                Local0 = Zero
                                While (((PBCR & 0x02) && (Local0 < 0x0A)))
                                {
                                    Local0++
                                    Sleep (One)
                                }

                                If (((PBCR & 0xFF) == One))
                                {
                                    Divide (PBDO, 0x0A, Local0, TMP2) /* \_SB_.PCI0.PEG0.PEGP.LCD0._BQC.TMP2 */
                                }
                            }

                            PBMX = Zero
                        }
                    }
                }

                P80H = TMP2 /* \_SB_.PCI0.PEG0.PEGP.LCD0._BQC.TMP2 */
                Return (TMP2) /* \_SB_.PCI0.PEG0.PEGP.LCD0._BQC.TMP2 */
            }
        }

        Device (HDM0)
        {
            Name (_ADR, 0x80008340)  // _ADR: Address
            Name (BTOF, Zero)
            Method (MASK, 0, NotSerialized)
            {
                If ((BTOF == Zero))
                {
                    BTOF++
                    BTOF = (One << BTOF) /* \_SB_.PCI0.PEG0.PEGP.HDM0.BTOF */
                }

                Return (BTOF) /* \_SB_.PCI0.PEG0.PEGP.HDM0.BTOF */
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((GACD & MASK ()))
                {
                    Return (0x1F)
                }

                Return (0x1D)
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((NACD & MASK ()))
                {
                    Return (One)
                }

                Return (Zero)
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (((Arg0 & 0xC0000000) == 0xC0000000)) {}
            }
        }

        Device (HDM1)
        {
            Name (_ADR, 0x80008341)  // _ADR: Address
            Name (BTOF, Zero)
            Method (MASK, 0, NotSerialized)
            {
                If ((BTOF == Zero))
                {
                    BTOF++
                    BTOF++
                    BTOF = (One << BTOF) /* \_SB_.PCI0.PEG0.PEGP.HDM1.BTOF */
                }

                Return (BTOF) /* \_SB_.PCI0.PEG0.PEGP.HDM1.BTOF */
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((GACD & MASK ()))
                {
                    Return (0x1F)
                }

                Return (0x1D)
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((NACD & MASK ()))
                {
                    Return (One)
                }

                Return (Zero)
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (((Arg0 & 0xC0000000) == 0xC0000000)) {}
            }
        }

        Device (DP0)
        {
            Name (_ADR, 0x80006320)  // _ADR: Address
            Name (BTOF, Zero)
            Method (MASK, 0, NotSerialized)
            {
                If ((BTOF == Zero))
                {
                    BTOF++
                    BTOF++
                    BTOF++
                    BTOF = (One << BTOF) /* \_SB_.PCI0.PEG0.PEGP.DP0_.BTOF */
                }

                Return (BTOF) /* \_SB_.PCI0.PEG0.PEGP.DP0_.BTOF */
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((GACD & MASK ()))
                {
                    Return (0x1F)
                }

                Return (0x1D)
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((NACD & MASK ()))
                {
                    Return (One)
                }

                Return (Zero)
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (((Arg0 & 0xC0000000) == 0xC0000000)) {}
            }
        }

        Device (DP1)
        {
            Name (_ADR, 0x80006330)  // _ADR: Address
            Name (BTOF, Zero)
            Method (MASK, 0, NotSerialized)
            {
                If ((BTOF == Zero))
                {
                    BTOF++
                    BTOF++
                    BTOF++
                    BTOF++
                    BTOF = (One << BTOF) /* \_SB_.PCI0.PEG0.PEGP.DP1_.BTOF */
                }

                Return (BTOF) /* \_SB_.PCI0.PEG0.PEGP.DP1_.BTOF */
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((GACD & MASK ()))
                {
                    Return (0x1F)
                }

                Return (0x1D)
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((NACD & MASK ()))
                {
                    Return (One)
                }

                Return (Zero)
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (((Arg0 & 0xC0000000) == 0xC0000000)) {}
            }
        }

        Name (NLIM, Zero)
        Name (GPSB, Buffer (0x24) {})
        CreateDWordField (GPSB, Zero, RETN)
        CreateDWordField (GPSB, 0x04, VRV1)
        CreateDWordField (GPSB, 0x08, TGPU)
        CreateDWordField (GPSB, 0x0C, PDTS)
        CreateDWordField (GPSB, 0x10, SFAN)
        CreateDWordField (GPSB, 0x14, SKNT)
        CreateDWordField (GPSB, 0x18, CPUE)
        CreateDWordField (GPSB, 0x1C, TMP1)
        CreateDWordField (GPSB, 0x20, TMP2)
        Name (GDL0, Buffer (0xAA)
        {
            /* 0000 */  0x5A, 0x96, 0x6D, 0xAB, 0xD5, 0xE2, 0x91, 0x33,  /* Z.m....3 */
            /* 0008 */  0x52, 0x44, 0xAA, 0x00, 0x00, 0x00, 0x00, 0x01,  /* RD...... */
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0xDE, 0x10, 0x00, 0x00,  /* ........ */
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0020 */  0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00,  /* ......4. */
            /* 0028 */  0x00, 0x00, 0x01, 0x00, 0x47, 0x00, 0x00, 0x00,  /* ....G... */
            /* 0030 */  0x02, 0x00, 0x45, 0x00, 0x00, 0x00, 0x03, 0x00,  /* ..E..... */
            /* 0038 */  0x5A, 0x00, 0x00, 0x00, 0x04, 0x00, 0x58, 0x00,  /* Z.....X. */
            /* 0040 */  0x00, 0x00, 0x05, 0x00, 0x56, 0x00, 0x00, 0x00,  /* ....V... */
            /* 0048 */  0x06, 0x00, 0x54, 0x00, 0x00, 0x00, 0x07, 0x00,  /* ..T..... */
            /* 0050 */  0x52, 0x00, 0x00, 0x00, 0x08, 0x00, 0x50, 0x00,  /* R.....P. */
            /* 0058 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0x1C,  /* ........ */
            /* 0060 */  0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  /* ........ */
            /* 0068 */  0x41, 0x5D, 0xC9, 0x00, 0x01, 0x24, 0x2E, 0x00,  /* A]...$.. */
            /* 0070 */  0x02, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01,  /* ........ */
            /* 0078 */  0x00, 0x00, 0x00, 0xD9, 0x1C, 0x04, 0x00, 0x00,  /* ........ */
            /* 0080 */  0x00, 0x03, 0x00, 0x00, 0x00, 0xE0, 0x7C, 0x97,  /* ......|. */
            /* 0088 */  0x01, 0xC1, 0x3D, 0x9C, 0xAD, 0x90, 0x00, 0x7F,  /* ..=..... */
            /* 0090 */  0xAB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 00A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 00A8 */  0x00, 0x00                                       /* .. */
        })
        Name (GDL1, Buffer (0xCC)
        {
            /* 0000 */  0xD9, 0x24, 0xFB, 0x84, 0xDC, 0x5D, 0x27, 0xF7,  /* .$...]'. */
            /* 0008 */  0x52, 0x44, 0xCC, 0x00, 0x00, 0x00, 0x00, 0x01,  /* RD...... */
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0xDE, 0x10, 0x00, 0x00,  /* ........ */
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0020 */  0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00,  /* ......4. */
            /* 0028 */  0x00, 0x00, 0x01, 0x00, 0x47, 0x00, 0x00, 0x00,  /* ....G... */
            /* 0030 */  0x02, 0x00, 0x63, 0x00, 0x00, 0x00, 0x03, 0x00,  /* ..c..... */
            /* 0038 */  0x7C, 0x00, 0x00, 0x00, 0x04, 0x00, 0x7A, 0x00,  /* |.....z. */
            /* 0040 */  0x00, 0x00, 0x05, 0x00, 0x78, 0x00, 0x00, 0x00,  /* ....x... */
            /* 0048 */  0x06, 0x00, 0x76, 0x00, 0x00, 0x00, 0x07, 0x00,  /* ..v..... */
            /* 0050 */  0x74, 0x00, 0x00, 0x00, 0x08, 0x00, 0x72, 0x00,  /* t.....r. */
            /* 0058 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0x1C,  /* ........ */
            /* 0060 */  0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  /* ........ */
            /* 0068 */  0x41, 0x5D, 0xC9, 0x00, 0x01, 0x24, 0x2E, 0x00,  /* A]...$.. */
            /* 0070 */  0x02, 0x00, 0xFF, 0x01, 0x00, 0x00, 0x00, 0xD9,  /* ........ */
            /* 0078 */  0x1C, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,  /* ........ */
            /* 0080 */  0x00, 0xC4, 0xC1, 0x54, 0x10, 0x30, 0xE4, 0x6C,  /* ...T.0.l */
            /* 0088 */  0x04, 0x00, 0x00, 0xFF, 0xFF, 0x04, 0x00, 0x00,  /* ........ */
            /* 0090 */  0x00, 0x36, 0x02, 0xB4, 0x43, 0x01, 0x00, 0x00,  /* .6..C... */
            /* 0098 */  0x00, 0xD9, 0x1C, 0x04, 0x00, 0x00, 0x00, 0x04,  /* ........ */
            /* 00A0 */  0x00, 0x00, 0x00, 0xE0, 0x7C, 0x97, 0x01, 0xC1,  /* ....|... */
            /* 00A8 */  0x3D, 0x9C, 0x48, 0x71, 0xD0, 0x68, 0x60, 0x01,  /* =.Hq.h`. */
            /* 00B0 */  0x00, 0x7F, 0xAB, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 00B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 00C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 00C8 */  0x00, 0x00, 0x00, 0x00                           /* .... */
        })
        Name (GDS0, Buffer (0xA6)
        {
            /* 0000 */  0x7E, 0x63, 0x5C, 0x0A, 0xAC, 0xD9, 0x6D, 0xCC,  /* ~c\...m. */
            /* 0008 */  0x52, 0x44, 0xA6, 0x00, 0x00, 0x00, 0x00, 0x01,  /* RD...... */
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0xDE, 0x10, 0x00, 0x00,  /* ........ */
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0020 */  0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00,  /* ......4. */
            /* 0028 */  0x00, 0x00, 0x01, 0x00, 0x47, 0x00, 0x00, 0x00,  /* ....G... */
            /* 0030 */  0x02, 0x00, 0x45, 0x00, 0x00, 0x00, 0x03, 0x00,  /* ..E..... */
            /* 0038 */  0x56, 0x00, 0x00, 0x00, 0x04, 0x00, 0x54, 0x00,  /* V.....T. */
            /* 0040 */  0x00, 0x00, 0x05, 0x00, 0x52, 0x00, 0x00, 0x00,  /* ....R... */
            /* 0048 */  0x06, 0x00, 0x50, 0x00, 0x00, 0x00, 0x07, 0x00,  /* ..P..... */
            /* 0050 */  0x4E, 0x00, 0x00, 0x00, 0x08, 0x00, 0x4C, 0x00,  /* N.....L. */
            /* 0058 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0x1C,  /* ........ */
            /* 0060 */  0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  /* ........ */
            /* 0068 */  0x41, 0x5D, 0xC9, 0x00, 0x01, 0x24, 0x2E, 0x00,  /* A]...$.. */
            /* 0070 */  0x02, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01,  /* ........ */
            /* 0078 */  0x00, 0x00, 0x00, 0xD9, 0x1C, 0x04, 0x00, 0x00,  /* ........ */
            /* 0080 */  0x00, 0x02, 0x00, 0x00, 0x00, 0xE0, 0x7C, 0x97,  /* ......|. */
            /* 0088 */  0x01, 0xC1, 0x3D, 0x9C, 0x40, 0x9C, 0x00, 0x00,  /* ..=.@... */
            /* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 00A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00               /* ...... */
        })
        Name (GDS1, Buffer (0xA6)
        {
            /* 0000 */  0x96, 0x7D, 0x8D, 0x1B, 0xBC, 0x18, 0x2F, 0xA0,  /* .}..../. */
            /* 0008 */  0x52, 0x44, 0xA6, 0x00, 0x00, 0x00, 0x00, 0x01,  /* RD...... */
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0xDE, 0x10, 0x00, 0x00,  /* ........ */
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0020 */  0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00,  /* ......4. */
            /* 0028 */  0x00, 0x00, 0x01, 0x00, 0x47, 0x00, 0x00, 0x00,  /* ....G... */
            /* 0030 */  0x02, 0x00, 0x45, 0x00, 0x00, 0x00, 0x03, 0x00,  /* ..E..... */
            /* 0038 */  0x56, 0x00, 0x00, 0x00, 0x04, 0x00, 0x54, 0x00,  /* V.....T. */
            /* 0040 */  0x00, 0x00, 0x05, 0x00, 0x52, 0x00, 0x00, 0x00,  /* ....R... */
            /* 0048 */  0x06, 0x00, 0x50, 0x00, 0x00, 0x00, 0x07, 0x00,  /* ..P..... */
            /* 0050 */  0x4E, 0x00, 0x00, 0x00, 0x08, 0x00, 0x4C, 0x00,  /* N.....L. */
            /* 0058 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0x1C,  /* ........ */
            /* 0060 */  0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  /* ........ */
            /* 0068 */  0x41, 0x5D, 0xC9, 0x00, 0x01, 0x24, 0x2E, 0x00,  /* A]...$.. */
            /* 0070 */  0x02, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01,  /* ........ */
            /* 0078 */  0x00, 0x00, 0x00, 0xD9, 0x1C, 0x04, 0x00, 0x00,  /* ........ */
            /* 0080 */  0x00, 0x02, 0x00, 0x00, 0x00, 0xE0, 0x7C, 0x97,  /* ......|. */
            /* 0088 */  0x01, 0xC1, 0x3D, 0x9C, 0x3E, 0x96, 0x00, 0x00,  /* ..=.>... */
            /* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 00A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00               /* ...... */
        })
        Name (GSG0, Buffer (0xD5)
        {
            /* 0000 */  0xBB, 0x73, 0x9E, 0x57, 0xA2, 0xCA, 0x10, 0xCF,  /* .s.W.... */
            /* 0008 */  0x4B, 0x56, 0xD5, 0x00, 0x00, 0x00, 0x01, 0x00,  /* KV...... */
            /* 0010 */  0x37, 0x35, 0x31, 0x31, 0x31, 0x35, 0x38, 0x37,  /* 75111587 */
            /* 0018 */  0x39, 0x38, 0x34, 0x39, 0x47, 0x65, 0x6E, 0x75,  /* 9849Genu */
            /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,  /* ine NVID */
            /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,  /* IA Certi */
            /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x47, 0x53, 0x79,  /* fied GSy */
            /* 0038 */  0x6E, 0x63, 0x20, 0x52, 0x65, 0x61, 0x64, 0x79,  /* nc Ready */
            /* 0040 */  0x20, 0x50, 0x6C, 0x61, 0x74, 0x66, 0x6F, 0x72,  /*  Platfor */
            /* 0048 */  0x6D, 0x20, 0x66, 0x6F, 0x72, 0x20, 0x43, 0x4C,  /* m for CL */
            /* 0050 */  0x45, 0x56, 0x4F, 0x20, 0x50, 0x36, 0x35, 0x30,  /* EVO P650 */
            /* 0058 */  0x52, 0x45, 0x20, 0x47, 0x58, 0x20, 0x4C, 0x47,  /* RE GX LG */
            /* 0060 */  0x20, 0x43, 0x20, 0x2D, 0x20, 0x4B, 0x30, 0x5A,  /*  C - K0Z */
            /* 0068 */  0x2A, 0x5B, 0x2B, 0x25, 0x5D, 0x52, 0x43, 0x51,  /* *[+%]RCQ */
            /* 0070 */  0x49, 0x29, 0x5F, 0x2C, 0x55, 0x26, 0x5E, 0x2C,  /* I)_,U&^, */
            /* 0078 */  0x4F, 0x21, 0x36, 0x2B, 0x2B, 0x3A, 0x56, 0x5F,  /* O!6++:V_ */
            /* 0080 */  0x59, 0x33, 0x2F, 0x2A, 0x24, 0x3B, 0x29, 0x5D,  /* Y3/*$;)] */
            /* 0088 */  0x47, 0x49, 0x45, 0x52, 0x49, 0x20, 0x2D, 0x20,  /* GIERI -  */
            /* 0090 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  /* Copyrigh */
            /* 0098 */  0x74, 0x20, 0x32, 0x30, 0x31, 0x34, 0x20, 0x4E,  /* t 2014 N */
            /* 00A0 */  0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43, 0x6F,  /* VIDIA Co */
            /* 00A8 */  0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69, 0x6F,  /* rporatio */
            /* 00B0 */  0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52, 0x69,  /* n All Ri */
            /* 00B8 */  0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65, 0x73,  /* ghts Res */
            /* 00C0 */  0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x35, 0x38,  /* erved-58 */
            /* 00C8 */  0x39, 0x36, 0x38, 0x34, 0x30, 0x32, 0x39, 0x33,  /* 96840293 */
            /* 00D0 */  0x38, 0x35, 0x28, 0x52, 0x29                     /* 85(R) */
        })
        Name (GSE0, Buffer (0xD5)
        {
            /* 0000 */  0x40, 0x94, 0x59, 0x06, 0x79, 0xF1, 0x29, 0x87,  /* @.Y.y.). */
            /* 0008 */  0x4B, 0x56, 0xD5, 0x00, 0x00, 0x00, 0x01, 0x00,  /* KV...... */
            /* 0010 */  0x37, 0x35, 0x31, 0x31, 0x31, 0x35, 0x38, 0x37,  /* 75111587 */
            /* 0018 */  0x39, 0x38, 0x34, 0x39, 0x47, 0x65, 0x6E, 0x75,  /* 9849Genu */
            /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,  /* ine NVID */
            /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,  /* IA Certi */
            /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x47, 0x53, 0x79,  /* fied GSy */
            /* 0038 */  0x6E, 0x63, 0x20, 0x52, 0x65, 0x61, 0x64, 0x79,  /* nc Ready */
            /* 0040 */  0x20, 0x50, 0x6C, 0x61, 0x74, 0x66, 0x6F, 0x72,  /*  Platfor */
            /* 0048 */  0x6D, 0x20, 0x66, 0x6F, 0x72, 0x20, 0x43, 0x4C,  /* m for CL */
            /* 0050 */  0x45, 0x56, 0x4F, 0x20, 0x50, 0x36, 0x35, 0x30,  /* EVO P650 */
            /* 0058 */  0x52, 0x45, 0x20, 0x47, 0x54, 0x20, 0x4C, 0x47,  /* RE GT LG */
            /* 0060 */  0x20, 0x43, 0x20, 0x2D, 0x20, 0x57, 0x4A, 0x24,  /*  C - WJ$ */
            /* 0068 */  0x23, 0x53, 0x30, 0x3B, 0x52, 0x26, 0x5C, 0x23,  /* #S0;R&\# */
            /* 0070 */  0x5A, 0x39, 0x2C, 0x32, 0x22, 0x32, 0x29, 0x56,  /* Z9,2"2)V */
            /* 0078 */  0x37, 0x46, 0x50, 0x31, 0x39, 0x5F, 0x33, 0x39,  /* 7FP19_39 */
            /* 0080 */  0x3A, 0x52, 0x4D, 0x4F, 0x40, 0x5F, 0x43, 0x3B,  /* :RMO@_C; */
            /* 0088 */  0x20, 0x21, 0x3C, 0x4F, 0x25, 0x20, 0x2D, 0x20,  /*  !<O% -  */
            /* 0090 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  /* Copyrigh */
            /* 0098 */  0x74, 0x20, 0x32, 0x30, 0x31, 0x34, 0x20, 0x4E,  /* t 2014 N */
            /* 00A0 */  0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43, 0x6F,  /* VIDIA Co */
            /* 00A8 */  0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69, 0x6F,  /* rporatio */
            /* 00B0 */  0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52, 0x69,  /* n All Ri */
            /* 00B8 */  0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65, 0x73,  /* ghts Res */
            /* 00C0 */  0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x35, 0x38,  /* erved-58 */
            /* 00C8 */  0x39, 0x36, 0x38, 0x34, 0x30, 0x32, 0x39, 0x33,  /* 96840293 */
            /* 00D0 */  0x38, 0x35, 0x28, 0x52, 0x29                     /* 85(R) */
        })
        Name (GSG1, Buffer (0xD5)
        {
            /* 0000 */  0xC4, 0xA5, 0xD1, 0xF2, 0x6E, 0x6B, 0x8E, 0x52,  /* ....nk.R */
            /* 0008 */  0x4B, 0x56, 0xD5, 0x00, 0x00, 0x00, 0x01, 0x00,  /* KV...... */
            /* 0010 */  0x37, 0x35, 0x31, 0x31, 0x31, 0x35, 0x38, 0x37,  /* 75111587 */
            /* 0018 */  0x39, 0x38, 0x34, 0x39, 0x47, 0x65, 0x6E, 0x75,  /* 9849Genu */
            /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,  /* ine NVID */
            /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,  /* IA Certi */
            /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x47, 0x53, 0x79,  /* fied GSy */
            /* 0038 */  0x6E, 0x63, 0x20, 0x52, 0x65, 0x61, 0x64, 0x79,  /* nc Ready */
            /* 0040 */  0x20, 0x50, 0x6C, 0x61, 0x74, 0x66, 0x6F, 0x72,  /*  Platfor */
            /* 0048 */  0x6D, 0x20, 0x66, 0x6F, 0x72, 0x20, 0x43, 0x4C,  /* m for CL */
            /* 0050 */  0x45, 0x56, 0x4F, 0x20, 0x50, 0x36, 0x37, 0x30,  /* EVO P670 */
            /* 0058 */  0x52, 0x47, 0x20, 0x47, 0x58, 0x20, 0x4C, 0x47,  /* RG GX LG */
            /* 0060 */  0x46, 0x48, 0x20, 0x2D, 0x20, 0x27, 0x50, 0x4F,  /* FH - 'PO */
            /* 0068 */  0x50, 0x58, 0x3F, 0x4D, 0x3B, 0x44, 0x48, 0x55,  /* PX?M;DHU */
            /* 0070 */  0x5A, 0x33, 0x30, 0x53, 0x59, 0x21, 0x2C, 0x4F,  /* Z30SY!,O */
            /* 0078 */  0x24, 0x51, 0x33, 0x25, 0x3C, 0x5F, 0x4E, 0x42,  /* $Q3%<_NB */
            /* 0080 */  0x5B, 0x4D, 0x31, 0x46, 0x59, 0x4C, 0x28, 0x51,  /* [M1FYL(Q */
            /* 0088 */  0x50, 0x27, 0x30, 0x5D, 0x48, 0x20, 0x2D, 0x20,  /* P'0]H -  */
            /* 0090 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  /* Copyrigh */
            /* 0098 */  0x74, 0x20, 0x32, 0x30, 0x31, 0x34, 0x20, 0x4E,  /* t 2014 N */
            /* 00A0 */  0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43, 0x6F,  /* VIDIA Co */
            /* 00A8 */  0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69, 0x6F,  /* rporatio */
            /* 00B0 */  0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52, 0x69,  /* n All Ri */
            /* 00B8 */  0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65, 0x73,  /* ghts Res */
            /* 00C0 */  0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x35, 0x38,  /* erved-58 */
            /* 00C8 */  0x39, 0x36, 0x38, 0x34, 0x30, 0x32, 0x39, 0x33,  /* 96840293 */
            /* 00D0 */  0x38, 0x35, 0x28, 0x52, 0x29                     /* 85(R) */
        })
        Name (GSE1, Buffer (0xD5)
        {
            /* 0000 */  0x11, 0x5B, 0xD1, 0xC7, 0xF4, 0x70, 0x2E, 0x08,  /* .[...p.. */
            /* 0008 */  0x4B, 0x56, 0xD5, 0x00, 0x00, 0x00, 0x01, 0x00,  /* KV...... */
            /* 0010 */  0x37, 0x35, 0x31, 0x31, 0x31, 0x35, 0x38, 0x37,  /* 75111587 */
            /* 0018 */  0x39, 0x38, 0x34, 0x39, 0x47, 0x65, 0x6E, 0x75,  /* 9849Genu */
            /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,  /* ine NVID */
            /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,  /* IA Certi */
            /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x47, 0x53, 0x79,  /* fied GSy */
            /* 0038 */  0x6E, 0x63, 0x20, 0x52, 0x65, 0x61, 0x64, 0x79,  /* nc Ready */
            /* 0040 */  0x20, 0x50, 0x6C, 0x61, 0x74, 0x66, 0x6F, 0x72,  /*  Platfor */
            /* 0048 */  0x6D, 0x20, 0x66, 0x6F, 0x72, 0x20, 0x43, 0x4C,  /* m for CL */
            /* 0050 */  0x45, 0x56, 0x4F, 0x20, 0x50, 0x36, 0x37, 0x30,  /* EVO P670 */
            /* 0058 */  0x20, 0x52, 0x45, 0x20, 0x47, 0x54, 0x20, 0x4C,  /*  RE GT L */
            /* 0060 */  0x47, 0x46, 0x20, 0x2D, 0x20, 0x4C, 0x31, 0x5B,  /* GF - L1[ */
            /* 0068 */  0x2B, 0x5A, 0x2A, 0x24, 0x5E, 0x55, 0x42, 0x50,  /* +Z*$^UBP */
            /* 0070 */  0x4A, 0x56, 0x5E, 0x2D, 0x56, 0x29, 0x5F, 0x2D,  /* JV^-V)_- */
            /* 0078 */  0x4E, 0x20, 0x37, 0x2A, 0x25, 0x3D, 0x51, 0x5E,  /* N 7*%=Q^ */
            /* 0080 */  0x5A, 0x30, 0x2C, 0x27, 0x25, 0x45, 0x2A, 0x5C,  /* Z0,'%E*\ */
            /* 0088 */  0x48, 0x4A, 0x46, 0x53, 0x53, 0x20, 0x2D, 0x20,  /* HJFSS -  */
            /* 0090 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  /* Copyrigh */
            /* 0098 */  0x74, 0x20, 0x32, 0x30, 0x31, 0x34, 0x20, 0x4E,  /* t 2014 N */
            /* 00A0 */  0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43, 0x6F,  /* VIDIA Co */
            /* 00A8 */  0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69, 0x6F,  /* rporatio */
            /* 00B0 */  0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52, 0x69,  /* n All Ri */
            /* 00B8 */  0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65, 0x73,  /* ghts Res */
            /* 00C0 */  0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x35, 0x38,  /* erved-58 */
            /* 00C8 */  0x39, 0x36, 0x38, 0x34, 0x30, 0x32, 0x39, 0x33,  /* 96840293 */
            /* 00D0 */  0x38, 0x35, 0x28, 0x52, 0x29                     /* 85(R) */
        })
        Name (GSG2, Buffer (0xD5)
        {
            /* 0000 */  0x3F, 0x44, 0x18, 0x6E, 0x9B, 0x12, 0xE6, 0x86,  /* ?D.n.... */
            /* 0008 */  0x4B, 0x56, 0xD5, 0x00, 0x00, 0x00, 0x01, 0x00,  /* KV...... */
            /* 0010 */  0x37, 0x35, 0x31, 0x31, 0x31, 0x35, 0x38, 0x37,  /* 75111587 */
            /* 0018 */  0x39, 0x38, 0x34, 0x39, 0x47, 0x65, 0x6E, 0x75,  /* 9849Genu */
            /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,  /* ine NVID */
            /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,  /* IA Certi */
            /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x47, 0x53, 0x79,  /* fied GSy */
            /* 0038 */  0x6E, 0x63, 0x20, 0x52, 0x65, 0x61, 0x64, 0x79,  /* nc Ready */
            /* 0040 */  0x20, 0x50, 0x6C, 0x61, 0x74, 0x66, 0x6F, 0x72,  /*  Platfor */
            /* 0048 */  0x6D, 0x20, 0x66, 0x6F, 0x72, 0x20, 0x43, 0x4C,  /* m for CL */
            /* 0050 */  0x45, 0x56, 0x4F, 0x20, 0x50, 0x36, 0x35, 0x30,  /* EVO P650 */
            /* 0058 */  0x52, 0x47, 0x20, 0x47, 0x58, 0x20, 0x53, 0x53,  /* RG GX SS */
            /* 0060 */  0x47, 0x20, 0x20, 0x2D, 0x20, 0x31, 0x39, 0x27,  /* G  - 19' */
            /* 0068 */  0x3B, 0x3E, 0x53, 0x51, 0x5D, 0x26, 0x2B, 0x35,  /* ;>SQ]&+5 */
            /* 0070 */  0x39, 0x54, 0x54, 0x37, 0x34, 0x58, 0x44, 0x26,  /* 9TT74XD& */
            /* 0078 */  0x32, 0x44, 0x2F, 0x56, 0x2A, 0x31, 0x39, 0x32,  /* 2D/V*192 */
            /* 0080 */  0x49, 0x3F, 0x27, 0x3E, 0x47, 0x2A, 0x57, 0x5D,  /* I?'>G*W] */
            /* 0088 */  0x25, 0x28, 0x3B, 0x5A, 0x4F, 0x20, 0x2D, 0x20,  /* %(;ZO -  */
            /* 0090 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  /* Copyrigh */
            /* 0098 */  0x74, 0x20, 0x32, 0x30, 0x31, 0x34, 0x20, 0x4E,  /* t 2014 N */
            /* 00A0 */  0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43, 0x6F,  /* VIDIA Co */
            /* 00A8 */  0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69, 0x6F,  /* rporatio */
            /* 00B0 */  0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52, 0x69,  /* n All Ri */
            /* 00B8 */  0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65, 0x73,  /* ghts Res */
            /* 00C0 */  0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x35, 0x38,  /* erved-58 */
            /* 00C8 */  0x39, 0x36, 0x38, 0x34, 0x30, 0x32, 0x39, 0x33,  /* 96840293 */
            /* 00D0 */  0x38, 0x35, 0x28, 0x52, 0x29                     /* 85(R) */
        })
        Name (GSE2, Buffer (0xD5)
        {
            /* 0000 */  0xF0, 0x1F, 0xA5, 0xF9, 0x3B, 0xFD, 0x19, 0x70,  /* ....;..p */
            /* 0008 */  0x4B, 0x56, 0xD5, 0x00, 0x00, 0x00, 0x01, 0x00,  /* KV...... */
            /* 0010 */  0x37, 0x35, 0x31, 0x31, 0x31, 0x35, 0x38, 0x37,  /* 75111587 */
            /* 0018 */  0x39, 0x38, 0x34, 0x39, 0x47, 0x65, 0x6E, 0x75,  /* 9849Genu */
            /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,  /* ine NVID */
            /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,  /* IA Certi */
            /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x47, 0x53, 0x79,  /* fied GSy */
            /* 0038 */  0x6E, 0x63, 0x20, 0x52, 0x65, 0x61, 0x64, 0x79,  /* nc Ready */
            /* 0040 */  0x20, 0x50, 0x6C, 0x61, 0x74, 0x66, 0x6F, 0x72,  /*  Platfor */
            /* 0048 */  0x6D, 0x20, 0x66, 0x6F, 0x72, 0x20, 0x43, 0x4C,  /* m for CL */
            /* 0050 */  0x45, 0x56, 0x4F, 0x20, 0x50, 0x36, 0x35, 0x30,  /* EVO P650 */
            /* 0058 */  0x52, 0x47, 0x20, 0x47, 0x54, 0x20, 0x53, 0x53,  /* RG GT SS */
            /* 0060 */  0x47, 0x20, 0x20, 0x2D, 0x20, 0x3D, 0x35, 0x23,  /* G  - =5# */
            /* 0068 */  0x3F, 0x3A, 0x5F, 0x2D, 0x59, 0x22, 0x2F, 0x4E,  /* ?:_-Y"/N */
            /* 0070 */  0x44, 0x28, 0x28, 0x4A, 0x30, 0x54, 0x40, 0x5A,  /* D((J0T@Z */
            /* 0078 */  0x36, 0x40, 0x23, 0x52, 0x21, 0x4A, 0x3D, 0x36,  /* 6@#R!J=6 */
            /* 0080 */  0x55, 0x33, 0x3B, 0x32, 0x43, 0x36, 0x53, 0x51,  /* U3;2C6SQ */
            /* 0088 */  0x21, 0x2C, 0x37, 0x5E, 0x4B, 0x20, 0x2D, 0x20,  /* !,7^K -  */
            /* 0090 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  /* Copyrigh */
            /* 0098 */  0x74, 0x20, 0x32, 0x30, 0x31, 0x34, 0x20, 0x4E,  /* t 2014 N */
            /* 00A0 */  0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43, 0x6F,  /* VIDIA Co */
            /* 00A8 */  0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69, 0x6F,  /* rporatio */
            /* 00B0 */  0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52, 0x69,  /* n All Ri */
            /* 00B8 */  0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65, 0x73,  /* ghts Res */
            /* 00C0 */  0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x35, 0x38,  /* erved-58 */
            /* 00C8 */  0x39, 0x36, 0x38, 0x34, 0x30, 0x32, 0x39, 0x33,  /* 96840293 */
            /* 00D0 */  0x38, 0x35, 0x28, 0x52, 0x29                     /* 85(R) */
        })
        Name (GSG3, Buffer (0xD5)
        {
            /* 0000 */  0xDF, 0x06, 0x47, 0x3B, 0xC9, 0x68, 0x04, 0x2F,  /* ..G;.h./ */
            /* 0008 */  0x4B, 0x56, 0xD5, 0x00, 0x00, 0x00, 0x01, 0x00,  /* KV...... */
            /* 0010 */  0x37, 0x35, 0x31, 0x31, 0x31, 0x35, 0x38, 0x37,  /* 75111587 */
            /* 0018 */  0x39, 0x38, 0x34, 0x39, 0x47, 0x65, 0x6E, 0x75,  /* 9849Genu */
            /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,  /* ine NVID */
            /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,  /* IA Certi */
            /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x47, 0x53, 0x79,  /* fied GSy */
            /* 0038 */  0x6E, 0x63, 0x20, 0x52, 0x65, 0x61, 0x64, 0x79,  /* nc Ready */
            /* 0040 */  0x20, 0x50, 0x6C, 0x61, 0x74, 0x66, 0x6F, 0x72,  /*  Platfor */
            /* 0048 */  0x6D, 0x20, 0x66, 0x6F, 0x72, 0x20, 0x43, 0x4C,  /* m for CL */
            /* 0050 */  0x45, 0x56, 0x4F, 0x20, 0x50, 0x36, 0x35, 0x30,  /* EVO P650 */
            /* 0058 */  0x52, 0x47, 0x20, 0x53, 0x53, 0x47, 0x20, 0x43,  /* RG SSG C */
            /* 0060 */  0x4F, 0x4F, 0x20, 0x2D, 0x20, 0x53, 0x5D, 0x3E,  /* OO - S]> */
            /* 0068 */  0x43, 0x48, 0x2E, 0x3E, 0x2E, 0x3B, 0x26, 0x43,  /* CH.>.;&C */
            /* 0070 */  0x41, 0x2B, 0x2B, 0x36, 0x35, 0x5D, 0x49, 0x2D,  /* A++65]I- */
            /* 0078 */  0x44, 0x30, 0x50, 0x47, 0x59, 0x22, 0x54, 0x2B,  /* D0PGY"T+ */
            /* 0080 */  0x33, 0x52, 0x5A, 0x5D, 0x25, 0x4D, 0x39, 0x25,  /* 3RZ]%M9% */
            /* 0088 */  0x53, 0x3C, 0x47, 0x2A, 0x3C, 0x20, 0x2D, 0x20,  /* S<G*< -  */
            /* 0090 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  /* Copyrigh */
            /* 0098 */  0x74, 0x20, 0x32, 0x30, 0x31, 0x34, 0x20, 0x4E,  /* t 2014 N */
            /* 00A0 */  0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43, 0x6F,  /* VIDIA Co */
            /* 00A8 */  0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69, 0x6F,  /* rporatio */
            /* 00B0 */  0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52, 0x69,  /* n All Ri */
            /* 00B8 */  0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65, 0x73,  /* ghts Res */
            /* 00C0 */  0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x35, 0x38,  /* erved-58 */
            /* 00C8 */  0x39, 0x36, 0x38, 0x34, 0x30, 0x32, 0x39, 0x33,  /* 96840293 */
            /* 00D0 */  0x38, 0x35, 0x28, 0x52, 0x29                     /* 85(R) */
        })
        Name (GSE3, Buffer (0xD5)
        {
            /* 0000 */  0xBE, 0x87, 0x79, 0xB5, 0xFA, 0x8F, 0xD7, 0xB2,  /* ..y..... */
            /* 0008 */  0x4B, 0x56, 0xD5, 0x00, 0x00, 0x00, 0x01, 0x00,  /* KV...... */
            /* 0010 */  0x37, 0x35, 0x31, 0x31, 0x31, 0x35, 0x38, 0x37,  /* 75111587 */
            /* 0018 */  0x39, 0x38, 0x34, 0x39, 0x47, 0x65, 0x6E, 0x75,  /* 9849Genu */
            /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,  /* ine NVID */
            /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,  /* IA Certi */
            /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x47, 0x53, 0x79,  /* fied GSy */
            /* 0038 */  0x6E, 0x63, 0x20, 0x52, 0x65, 0x61, 0x64, 0x79,  /* nc Ready */
            /* 0040 */  0x20, 0x50, 0x6C, 0x61, 0x74, 0x66, 0x6F, 0x72,  /*  Platfor */
            /* 0048 */  0x6D, 0x20, 0x66, 0x6F, 0x72, 0x20, 0x43, 0x4C,  /* m for CL */
            /* 0050 */  0x45, 0x56, 0x4F, 0x20, 0x50, 0x36, 0x35, 0x30,  /* EVO P650 */
            /* 0058 */  0x52, 0x45, 0x20, 0x53, 0x53, 0x47, 0x20, 0x47,  /* RE SSG G */
            /* 0060 */  0x54, 0x20, 0x20, 0x2D, 0x20, 0x3B, 0x33, 0x21,  /* T  - ;3! */
            /* 0068 */  0x31, 0x38, 0x5D, 0x2B, 0x57, 0x20, 0x2D, 0x4C,  /* 18]+W -L */
            /* 0070 */  0x42, 0x2A, 0x2E, 0x48, 0x4D, 0x52, 0x5E, 0x58,  /* B*.HMR^X */
            /* 0078 */  0x34, 0x5E, 0x25, 0x50, 0x2F, 0x48, 0x33, 0x34,  /* 4^%P/H34 */
            /* 0080 */  0x53, 0x35, 0x39, 0x30, 0x5D, 0x34, 0x2D, 0x57,  /* S590]4-W */
            /* 0088 */  0x23, 0x22, 0x30, 0x5C, 0x45, 0x20, 0x2D, 0x20,  /* #"0\E -  */
            /* 0090 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  /* Copyrigh */
            /* 0098 */  0x74, 0x20, 0x32, 0x30, 0x31, 0x34, 0x20, 0x4E,  /* t 2014 N */
            /* 00A0 */  0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43, 0x6F,  /* VIDIA Co */
            /* 00A8 */  0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69, 0x6F,  /* rporatio */
            /* 00B0 */  0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52, 0x69,  /* n All Ri */
            /* 00B8 */  0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65, 0x73,  /* ghts Res */
            /* 00C0 */  0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x35, 0x38,  /* erved-58 */
            /* 00C8 */  0x39, 0x36, 0x38, 0x34, 0x30, 0x32, 0x39, 0x33,  /* 96840293 */
            /* 00D0 */  0x38, 0x35, 0x28, 0x52, 0x29                     /* 85(R) */
        })
        Name (TLPK, Package (0x28)
        {
            0x8000A450, 
            0x2C, 
            0x80008340, 
            0x2C, 
            0x80008341, 
            0x2C, 
            0x80006320, 
            0x2C, 
            0x80006330, 
            0x2C, 
            0x8000A450, 
            0x80008340, 
            0x26, 
            0x8000A450, 
            0x80008341, 
            0x26, 
            0x8000A450, 
            0x80006320, 
            0x26, 
            0x8000A450, 
            0x80006330, 
            0x26, 
            0x80008340, 
            0x80008341, 
            0x26, 
            0x80008340, 
            0x80006320, 
            0x26, 
            0x80008340, 
            0x80006330, 
            0x26, 
            0x80008341, 
            0x80006320, 
            0x26, 
            0x80008341, 
            0x80006330, 
            0x26, 
            0x80006320, 
            0x80006330, 
            0x26
        })
        Method (GTLL, 0, NotSerialized)
        {
            If ((TLPL == Zero))
            {
                Local0 = Zero
                Local0++
                Local0++
                Local0++
                Local0++
                Local0++
                Local0++
                Local0++
                Local0++
                Local0++
                Local0++
                Local0++
                Local0++
                Local0++
                Local0++
                Local0++
                TLPL = Local0
            }

            Return (TLPL) /* \_SB_.PCI0.PEG0.PEGP.TLPL */
        }

        Method (SDID, 1, Serialized)
        {
            Local0 = ToInteger (Arg0)
            If ((\_SB.PCI0.PEG0.PEGP.LCD0._ADR () == Local0))
            {
                Return (\_SB.PCI0.PEG0.PEGP.LCD0.MASK ())
            }

            If ((\_SB.PCI0.PEG0.PEGP.HDM0._ADR == Local0))
            {
                Return (\_SB.PCI0.PEG0.PEGP.HDM0.MASK ())
            }

            If ((\_SB.PCI0.PEG0.PEGP.HDM1._ADR == Local0))
            {
                Return (\_SB.PCI0.PEG0.PEGP.HDM1.MASK ())
            }

            If ((\_SB.PCI0.PEG0.PEGP.DP0._ADR == Local0))
            {
                Return (\_SB.PCI0.PEG0.PEGP.DP0.MASK ())
            }

            If ((\_SB.PCI0.PEG0.PEGP.DP1._ADR == Local0))
            {
                Return (\_SB.PCI0.PEG0.PEGP.DP1.MASK ())
            }

            Return (Zero)
        }

        Method (ITOM, 1, Serialized)
        {
            Local0 = One
            Local1 = Zero
            Local2 = ToInteger (Arg0)
            Local3 = Zero
            If ((Local2 > TLPL))
            {
                Return (Zero)
            }

            While ((Local0 < Local2))
            {
                Local3 = DerefOf (TLPK [Local1])
                If ((((Local3 == 0x2C) || (Local3 == 0x26)) || (Local3 == 0x2B)))
                {
                    Local0++
                }

                Local1++
            }

            Local4 = SDID (DerefOf (TLPK [Local1]))
            Local1++
            Local3 = DerefOf (TLPK [Local1])
            If ((DerefOf (TLPK [Local1]) != 0x2C))
            {
                Local4 |= SDID (DerefOf (TLPK [Local1]))
            }

            Return (Local4)
        }

        Method (MTOI, 1, Serialized)
        {
            Local0 = One
            Local1 = Zero
            Local2 = ToInteger (Arg0)
            Local3 = Zero
            Local4 = Zero
            While ((Local0 <= TLPL))
            {
                Local3 = DerefOf (TLPK [Local1])
                If ((((Local3 == 0x2C) || (Local3 == 0x26)) || (Local3 == 0x2B)))
                {
                    If (((Local2 & Local4) == Local2))
                    {
                        Return (Local0)
                    }

                    Local0++
                    Local4 = Zero
                }
                Else
                {
                    Local4 |= SDID (Local3)
                }

                Local1++
            }

            Return (TLPL) /* \_SB_.PCI0.PEG0.PEGP.TLPL */
        }

        Method (G3DK, 0, NotSerialized)
        {
            Name (BUFX, Buffer (0x32)
            {
                 0x00                                             /* . */
            })
            BUFX = K3DB /* \_SB_.PCI0.PEG0.PEGP.K3DB */
            If ((OSYS < 0x07DC))
            {
                Name (FPKG, Package (0x10) {})
                Local0 = Zero
                If ((K3DL > 0x10))
                {
                    Local7 = 0x10
                }
                Else
                {
                    Local7 = K3DL /* \_SB_.PCI0.PEG0.PEGP.K3DL */
                }

                While ((Local0 < Local7))
                {
                    Local1 = DerefOf (BUFX [Local0])
                    FPKG [Local0] = Local1
                    Local0++
                }

                Return (FPKG) /* \_SB_.PCI0.PEG0.PEGP.G3DK.FPKG */
            }

            Name (PKGX, Package (K3DL) {})
            Local0 = Zero
            While ((Local0 < K3DL))
            {
                Local1 = DerefOf (BUFX [Local0])
                PKGX [Local0] = Local1
                Local0++
            }

            Return (PKGX) /* \_SB_.PCI0.PEG0.PEGP.G3DK.PKGX */
        }

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            Name (_T_7, Zero)  // _T_x: Emitted by ASL Compiler
            Name (_T_6, Zero)  // _T_x: Emitted by ASL Compiler
            Name (_T_5, Zero)  // _T_x: Emitted by ASL Compiler
            Name (_T_4, Zero)  // _T_x: Emitted by ASL Compiler
            Name (_T_3, Zero)  // _T_x: Emitted by ASL Compiler
            Name (_T_2, Zero)  // _T_x: Emitted by ASL Compiler
            Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            Debug = "------- GPS DSM --------"
            If ((Arg0 == ToUUID ("4004a400-917d-4cf2-b89c-79b62fd55665")))
            {
                If ((Arg1 != 0x0300))
                {
                    Return (0x80000002)
                }

                While (One)
                {
                    _T_0 = ToInteger (Arg2)
                    If ((_T_0 == Zero))
                    {
                        Return (Buffer (0x04)
                        {
                             0x01, 0x00, 0x01, 0x01                           /* .... */
                        })
                    }
                    ElseIf ((_T_0 == 0x04)) {}
                    ElseIf ((_T_0 == 0x05)) {}
                    ElseIf ((_T_0 == 0x06)) {}
                    ElseIf ((_T_0 == 0x10))
                    {
                        CreateByteField (Arg3, Zero, PGOF)
                        CreateByteField (Arg3, 0x02, MXSI)
                        If ((PGOF != Zero))
                        {
                            Return (0x80000001)
                        }

                        If (!(((MXSI >= 0x80) || (MXSI <= 0x8F)) || 
                            (MXSI == 0x30)))
                        {
                            Return (0x80000001)
                        }

                        If (MXML)
                        {
                            Name (BUF, Buffer (MXML)
                            {
                                 0x00                                             /* . */
                            })
                            BUF = MXM3 /* \_SB_.PCI0.PEG0.PEGP.MXM3 */
                            Return (BUF) /* \_SB_.PCI0.PEG0.PEGP._DSM.BUF_ */
                        }
                    }
                    ElseIf ((_T_0 == 0x12)) {}
                    ElseIf ((_T_0 == 0x18))
                    {
                        Return (Unicode ("0"))
                    }
                    ElseIf ((_T_0 == 0x19)) {}
                    Break
                }

                Return (0x80000002)
            }

            If ((Arg0 == ToUUID ("a3132d01-8cda-49ba-a52e-bc9d46df6b81")))
            {
                If ((Arg1 != 0x0100))
                {
                    Return (Buffer (0x04)
                    {
                         0x02, 0x00, 0x00, 0x80                           /* .... */
                    })
                }

                While (One)
                {
                    _T_1 = ToInteger (Arg2)
                    If ((_T_1 == Zero))
                    {
                        Return (Buffer (0x08)
                        {
                             0x01, 0x00, 0x08, 0x00, 0x0F, 0x04, 0x00, 0x00   /* ........ */
                        })
                    }
                    ElseIf ((_T_1 == 0x13))
                    {
                        Local0 = Buffer (0x04)
                            {
                                 0x00, 0x00, 0x00, 0x00                           /* .... */
                            }
                        CreateField (Arg3, 0x02, One, PPST)
                        CreateBitField (Local0, 0x02, CPST)
                        If ((ToInteger (PPST) && \_SB.PCI0.LPCB.EC.GP12))
                        {
                            \_SB.PCI0.LPCB.EC.EP12 = One
                            \_SB.PCI0.LPCB.EC.GP12 = Zero
                        }

                        CPST = One
                        Return (Local0)
                    }
                    ElseIf ((_T_1 == 0x20))
                    {
                        Name (RET1, Zero)
                        CreateBitField (Arg3, 0x18, NRIT)
                        CreateBitField (Arg3, 0x19, NRIS)
                        If (NRIS)
                        {
                            If (NRIT)
                            {
                                \_SB.AC.ADJP (0x10000000)
                            }
                            Else
                            {
                                \_SB.AC.ADJP (0x10000001)
                            }
                        }

                        If ((\_SB.PCI0.PEG1.PEGP.VID == 0xFFFF))
                        {
                            RET1 |= 0x40000000
                        }

                        If (NLIM)
                        {
                            RET1 |= One
                        }

                        If ((\_SB.AC.CTMS & 0xFFFFFFFC))
                        {
                            \PRM0 = 0x09
                            \SSMP = 0xE0
                            \_SB.AC.CTMS = \PRM1 /* External reference */
                        }

                        If ((\_SB.AC.CTMS & One))
                        {
                            RET1 &= 0xFEFFFFFF
                        }
                        Else
                        {
                            RET1 |= 0x01000000
                        }

                        Return (RET1) /* \_SB_.PCI0.PEG0.PEGP._DSM.RET1 */
                    }
                    ElseIf ((_T_1 == 0x21))
                    {
                        Return (\_PR.CPU0._PSS ())
                    }
                    ElseIf ((_T_1 == 0x22))
                    {
                        CreateByteField (Arg3, Zero, PCAP)
                        If ((GPCF & One))
                        {
                            \_SB.AC.GPSF = One
                            If ((\_SB.PCI0.LPCB.EC.ADP == One))
                            {
                                \_SB.AC.ADJP ((PCAP | 0x40000000))
                            }
                            Else
                            {
                                \_SB.AC.ADJP (Zero)
                            }

                            \_SB.AC.GPSF = Zero
                        }

                        Return (PCAP) /* \_SB_.PCI0.PEG0.PEGP._DSM.PCAP */
                    }
                    ElseIf ((_T_1 == 0x23))
                    {
                        Return (\_PR.CPU0._PPC ())
                    }
                    ElseIf ((_T_1 == 0x25))
                    {
                        Return (\_PR.CPU0._TSS) /* External reference */
                    }
                    ElseIf ((_T_1 == 0x26))
                    {
                        CreateDWordField (Arg3, Zero, TCAP)
                        \_PR.CPU0._PTC = TCAP /* \_SB_.PCI0.PEG0.PEGP._DSM.TCAP */
                        Notify (\_PR.CPU0, 0x80) // Status Change
                        Return (TCAP) /* \_SB_.PCI0.PEG0.PEGP._DSM.TCAP */
                    }
                    ElseIf ((_T_1 == 0x2A))
                    {
                        CreateByteField (Arg3, Zero, PSH0)
                        CreateByteField (Arg3, One, PSH1)
                        CreateBitField (Arg3, 0x08, GPUT)
                        CreateBitField (Arg3, 0x09, CPUT)
                        CreateBitField (Arg3, 0x0A, FANS)
                        CreateBitField (Arg3, 0x0B, SKIN)
                        CreateBitField (Arg3, 0x0C, ENGR)
                        CreateBitField (Arg3, 0x0D, SEN1)
                        CreateBitField (Arg3, 0x0E, SEN2)
                        While (One)
                        {
                            _T_2 = ToInteger (PSH0)
                            If ((_T_2 == Zero))
                            {
                                If (CPUT)
                                {
                                    RETN = 0x0200
                                    RETN |= PSH0 /* \_SB_.PCI0.PEG0.PEGP._DSM.PSH0 */
                                    If (\_SB.PCI0.LPCB.EC.ECOK)
                                    {
                                        PDTS = \_SB.PCI0.LPCB.EC.TMP /* External reference */
                                    }
                                    Else
                                    {
                                        PDTS = 0x2D
                                    }
                                }

                                Return (GPSB) /* \_SB_.PCI0.PEG0.PEGP.GPSB */
                            }
                            ElseIf ((_T_2 == One))
                            {
                                RETN = 0x0300
                                RETN |= PSH0 /* \_SB_.PCI0.PEG0.PEGP._DSM.PSH0 */
                                PDTS = 0x03E8
                                Return (GPSB) /* \_SB_.PCI0.PEG0.PEGP.GPSB */
                            }
                            ElseIf ((_T_2 == 0x02))
                            {
                                RETN = Zero
                                RETN |= PSH0 /* \_SB_.PCI0.PEG0.PEGP._DSM.PSH0 */
                                VRV1 = Zero
                                TGPU = Zero
                                PDTS = Zero
                                SFAN = Zero
                                CPUE = Zero
                                SKNT = Zero
                                TMP1 = Zero
                                TMP2 = Zero
                                If (GPUT)
                                {
                                    RETN |= 0x0100
                                    TGPU = GTTP /* \_SB_.PCI0.PEG0.PEGP.GTTP */
                                }

                                If (CPUT)
                                {
                                    RETN |= 0x0200
                                    PDTS = 0x64
                                }

                                Return (GPSB) /* \_SB_.PCI0.PEG0.PEGP.GPSB */
                            }

                            Break
                        }
                    }

                    Break
                }
            }

            If ((Arg0 == ToUUID ("d4a50b75-65c7-46f7-bfb7-41514cea0244")))
            {
                If ((Arg1 != 0x0102))
                {
                    Return (0x80000002)
                }

                While (One)
                {
                    _T_3 = ToInteger (Arg2)
                    If ((_T_3 == Zero))
                    {
                        If (K3DL)
                        {
                            Return (Buffer (0x04)
                            {
                                 0x71, 0x00, 0x55, 0x00                           /* q.U. */
                            })
                        }
                        Else
                        {
                            Return (Buffer (0x04)
                            {
                                 0x71, 0x00, 0x15, 0x00                           /* q... */
                            })
                        }
                    }
                    ElseIf ((_T_3 == One))
                    {
                        Name (TEMP, Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           /* .... */
                        })
                        CreateDWordField (TEMP, Zero, STS0)
                        STS0 |= Zero
                        Return (TEMP) /* \_SB_.PCI0.PEG0.PEGP._DSM.TEMP */
                    }
                    ElseIf ((_T_3 == 0x04))
                    {
                        Name (TMP3, Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           /* .... */
                        })
                        CreateDWordField (TMP3, Zero, STS3)
                        ToInteger (Arg3, Local0)
                        Local1 = Local0
                        Local0 >>= 0x10
                        USPM = (Local0 & One)
                        Local1 >>= 0x0D
                        Local1 &= 0x03
                        If ((Local1 != GPSP))
                        {
                            If ((USPM == One))
                            {
                                GPSP = Local1
                            }
                            Else
                            {
                                Local1 = GPSP /* \_SB_.PCI0.PEG0.PEGP.GPSP */
                                STS3 |= 0x8000
                            }
                        }

                        STS3 |= (Local1 << 0x0D)
                        Return (TMP3) /* \_SB_.PCI0.PEG0.PEGP._DSM.TMP3 */
                    }
                    ElseIf ((_T_3 == 0x05))
                    {
                        Name (TMP4, Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           /* .... */
                        })
                        CreateDWordField (TMP4, Zero, STS4)
                        ToInteger (Arg3, Local0)
                        GTLL ()
                        If ((Local0 & 0x80000000))
                        {
                            TLSN = ((Local0 >> 0x19) & 0x1F)
                            If ((Local0 & 0x40000000))
                            {
                                DOSF = One
                            }
                        }

                        If ((Local0 & 0x01000000))
                        {
                            GACD = ((Local0 >> 0x0C) & 0x0FFF)
                            GATD = (Local0 & 0x0FFF)
                            TLSN = (MTOI (GACD) + One)
                        }

                        DHPE = 0x1F
                        If ((TLSN > TLPL))
                        {
                            TLSN = One
                        }

                        NACD = ITOM (TLSN)
                        If (((NACD & GATD) == NACD))
                        {
                            Break
                        }

                        TLSN++
                        STS4 |= (DHPE << 0x15)
                        STS4 |= (DHPS << 0x14)
                        STS4 |= (TLSN << 0x08)
                        STS4 |= (LDES << 0x04)
                        LDES = Zero
                        DHPS = Zero
                        DHPE = Zero
                        Return (TMP4) /* \_SB_.PCI0.PEG0.PEGP._DSM.TMP4 */
                    }
                    ElseIf ((_T_3 == 0x06))
                    {
                        Return (TLPK) /* \_SB_.PCI0.PEG0.PEGP.TLPK */
                    }
                    ElseIf ((_T_3 == 0x10))
                    {
                        CreateWordField (Arg3, 0x02, BFF0)
                        If (((LMID == 0xE430) && (LPID == 0x046F)))
                        {
                            If ((BFF0 == 0x4452))
                            {
                                Debug = "BFF0, 0x4452"
                                Return (GDL0) /* \_SB_.PCI0.PEG0.PEGP.GDL0 */
                            }

                            If ((BFF0 == 0x564B))
                            {
                                While (One)
                                {
                                    _T_4 = ToInteger (PDID)
                                    If ((_T_4 == 0x1617))
                                    {
                                        Debug = "BFF0, 0x564B"
                                        Return (GSG0) /* \_SB_.PCI0.PEG0.PEGP.GSG0 */
                                    }
                                    ElseIf ((_T_4 == 0x1618))
                                    {
                                        Debug = "BFF0, 0x564B"
                                        Return (GSE0) /* \_SB_.PCI0.PEG0.PEGP.GSE0 */
                                    }

                                    Break
                                }
                            }
                        }

                        If (((LMID == 0xE430) && (LPID == 0x046C)))
                        {
                            If ((BFF0 == 0x4452))
                            {
                                Debug = "BFF0, 0x4452"
                                Return (GDL1) /* \_SB_.PCI0.PEG0.PEGP.GDL1 */
                            }

                            If ((BFF0 == 0x564B))
                            {
                                While (One)
                                {
                                    _T_5 = ToInteger (PDID)
                                    If ((_T_5 == 0x1617))
                                    {
                                        Debug = "BFF0, 0x564B"
                                        Return (GSG1) /* \_SB_.PCI0.PEG0.PEGP.GSG1 */
                                    }
                                    ElseIf ((_T_5 == 0x1618))
                                    {
                                        Debug = "BFF0, 0x564B"
                                        Return (GSE1) /* \_SB_.PCI0.PEG0.PEGP.GSE1 */
                                    }

                                    Break
                                }
                            }
                        }

                        If (((LMID == 0x834C) && (LPID == 0x434B)))
                        {
                            If ((BFF0 == 0x4452))
                            {
                                Debug = "BFF0, 0x4452"
                                Return (GDS0) /* \_SB_.PCI0.PEG0.PEGP.GDS0 */
                            }

                            If ((BFF0 == 0x564B))
                            {
                                While (One)
                                {
                                    _T_6 = ToInteger (PDID)
                                    If ((_T_6 == 0x1617))
                                    {
                                        Debug = "BFF0, 0x564B"
                                        Return (GSG2) /* \_SB_.PCI0.PEG0.PEGP.GSG2 */
                                    }
                                    ElseIf ((_T_6 == 0x1618))
                                    {
                                        Debug = "BFF0, 0x564B"
                                        Return (GSE2) /* \_SB_.PCI0.PEG0.PEGP.GSE2 */
                                    }

                                    Break
                                }
                            }
                        }

                        If (((LMID == 0x834C) && (LPID == 0x4852)))
                        {
                            If ((BFF0 == 0x4452))
                            {
                                Debug = "BFF0, 0x4452"
                                Return (GDS1) /* \_SB_.PCI0.PEG0.PEGP.GDS1 */
                            }

                            If ((BFF0 == 0x564B))
                            {
                                While (One)
                                {
                                    _T_7 = ToInteger (PDID)
                                    If ((_T_7 == 0x1617))
                                    {
                                        Debug = "BFF0, 0x564B"
                                        Return (GSG3) /* \_SB_.PCI0.PEG0.PEGP.GSG3 */
                                    }
                                    ElseIf ((_T_7 == 0x1618))
                                    {
                                        Debug = "BFF0, 0x564B"
                                        Return (GSE3) /* \_SB_.PCI0.PEG0.PEGP.GSE3 */
                                    }

                                    Break
                                }
                            }
                        }
                    }
                    ElseIf ((_T_3 == 0x11)) {}
                    ElseIf ((_T_3 == 0x12))
                    {
                        Return (Package (0x02)
                        {
                            0xF0, 
                            ToUUID ("360d6fb6-1d4e-4fa6-b848-1be33dd8ec7b")
                        })
                    }
                    ElseIf ((_T_3 == 0x13)) {}
                    ElseIf ((_T_3 == 0x14))
                    {
                        Name (BLPK, Package (0x09)
                        {
                            0x8000A450, 
                            0x0100, 
                            Zero, 
                            Zero, 
                            One, 
                            One, 
                            0xFA, 
                            Zero, 
                            0x03E8
                        })
                        If (SDIL)
                        {
                            BLPK [Zero] = SDIL /* \_SB_.PCI0.PEG0.PEGP.SDIL */
                        }

                        If (((OSYS >= 0x07D9) || (OSYS == 0x03E8)))
                        {
                            BLPK [One] = 0x0200
                        }

                        BLPK [0x06] = PWMF /* \_SB_.PCI0.PEG0.PEGP.PWMF */
                        BLPK [0x07] = MIND /* \_SB_.PCI0.PEG0.PEGP.MIND */
                        BLPK [0x08] = MAXD /* \_SB_.PCI0.PEG0.PEGP.MAXD */
                        Return (BLPK) /* \_SB_.PCI0.PEG0.PEGP._DSM.BLPK */
                    }
                    ElseIf ((_T_3 == 0x15)) {}
                    ElseIf ((_T_3 == 0x16))
                    {
                        If ((DerefOf (Arg3 [Zero]) == One))
                        {
                            If (K3DL)
                            {
                                Return (G3DK ())
                            }
                        }
                    }
                    ElseIf ((_T_3 == 0x17)) {}
                    Break
                }

                Return (0x80000002)
            }

            Return (0x80000001)
        }
    }

    Scope (\_SB.PCI0.PEG1.PEGP)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            _ADR = Zero
        }

        OperationRegion (RPCI, PCI_Config, Zero, 0x0100)
        Field (RPCI, DWordAcc, Lock, Preserve)
        {
            VID,    16, 
            DID,    16
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((VID == 0x10DE))
            {
                Return (0x0F)
            }

            Return (Zero)
        }

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            If ((Arg0 == ToUUID ("4004a400-917d-4cf2-b89c-79b62fd55665")))
            {
                If ((Arg1 != 0x0300))
                {
                    Return (0x80000002)
                }

                While (One)
                {
                    _T_0 = ToInteger (Arg2)
                    If ((_T_0 == Zero))
                    {
                        Return (Buffer (0x04)
                        {
                             0x01, 0x00, 0x01, 0x01                           /* .... */
                        })
                    }
                    ElseIf ((_T_0 == 0x04)) {}
                    ElseIf ((_T_0 == 0x05)) {}
                    ElseIf ((_T_0 == 0x06)) {}
                    ElseIf ((_T_0 == 0x10))
                    {
                        If ((VID == 0x10DE))
                        {
                            CreateByteField (Arg3, Zero, PGOF)
                            CreateByteField (Arg3, 0x02, MXSI)
                            If ((PGOF != Zero))
                            {
                                Return (0x80000001)
                            }

                            If (!(((MXSI >= 0x80) || (MXSI <= 0x8F)) || 
                                (MXSI == 0x30)))
                            {
                                Return (0x80000001)
                            }

                            If (\_SB.PCI0.PEG0.PEGP.MX2L)
                            {
                                Name (BUF, Buffer (\_SB.PCI0.PEG0.PEGP.MX2L)
                                {
                                     0x00                                             /* . */
                                })
                                BUF = \_SB.PCI0.PEG0.PEGP.MX32
                                Return (BUF) /* \_SB_.PCI0.PEG1.PEGP._DSM.BUF_ */
                            }
                        }
                    }
                    ElseIf ((_T_0 == 0x12)) {}
                    ElseIf ((_T_0 == 0x18))
                    {
                        Return (Unicode ("0"))
                    }
                    ElseIf ((_T_0 == 0x19)) {}
                    Break
                }

                Return (0x80000002)
            }

            Return (0x80000001)
        }
    }

    Scope (\_SB.PCI0)
    {
        Device (WMI1)
        {
            Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, "MXM2")  // _UID: Unique ID
            Name (_WDG, Buffer (0x78)
            {
                /* 0000 */  0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xBD, 0x4E,  /* <\.....N */
                /* 0008 */  0xB5, 0x77, 0x93, 0x1E, 0xA3, 0x2A, 0x2C, 0xC0,  /* .w...*,. */
                /* 0010 */  0x4D, 0x58, 0x01, 0x02, 0x62, 0xDE, 0x6B, 0xE0,  /* MX..b.k. */
                /* 0018 */  0x75, 0xEE, 0xF4, 0x48, 0xA5, 0x83, 0xB2, 0x3E,  /* u..H...> */
                /* 0020 */  0x69, 0xAB, 0xFB, 0x91, 0x80, 0x00, 0x01, 0x08,  /* i....... */
                /* 0028 */  0x0F, 0xBD, 0xDE, 0x3A, 0x5F, 0x0C, 0xED, 0x46,  /* ...:_..F */
                /* 0030 */  0xAB, 0x2E, 0x04, 0x96, 0x2B, 0x4F, 0xDC, 0xBC,  /* ....+O.. */
                /* 0038 */  0x81, 0x00, 0x01, 0x08, 0x11, 0x93, 0x51, 0x1E,  /* ......Q. */
                /* 0040 */  0x75, 0x3E, 0x08, 0x42, 0xB0, 0x5E, 0xEB, 0xE1,  /* u>.B.^.. */
                /* 0048 */  0x7E, 0x3F, 0xF4, 0x1F, 0x86, 0x00, 0x01, 0x08,  /* ~?...... */
                /* 0050 */  0x41, 0x53, 0xF8, 0x37, 0x18, 0x44, 0x24, 0x4F,  /* AS.7.D$O */
                /* 0058 */  0x85, 0x33, 0x38, 0xFF, 0xC7, 0x29, 0x55, 0x42,  /* .38..)UB */
                /* 0060 */  0x87, 0x00, 0x01, 0x08, 0x21, 0x12, 0x90, 0x05,  /* ....!... */
                /* 0068 */  0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,  /* f....... */
                /* 0070 */  0xC9, 0x06, 0x29, 0x10, 0x58, 0x4D, 0x01, 0x00   /* ..).XM.. */
            })
            Method (WMMX, 3, NotSerialized)
            {
                CreateDWordField (Arg2, Zero, FUNC)
                If ((FUNC == 0x41494C53)) {}
                If ((FUNC == 0x4D53445F))
                {
                    If ((SizeOf (Arg2) >= 0x1C))
                    {
                        CreateField (Arg2, 0x20, 0x80, MUID)
                        CreateDWordField (Arg2, 0x14, REVI)
                        CreateDWordField (Arg2, 0x18, SFNC)
                        CreateField (Arg2, 0xE0, 0x20, XRG0)
                        If (((Arg1 & 0xFF) == One))
                        {
                            Return (\_SB.PCI0.PEG0.PEGP._DSM (MUID, REVI, SFNC, XRG0))
                        }

                        If (((Arg1 & 0xFF) == 0x02))
                        {
                            Return (\_SB.PCI0.PEG1.PEGP._DSM (MUID, REVI, SFNC, XRG0))
                        }
                    }
                }

                Return (Zero)
            }

            Name (WQXM, Buffer (0x029C)
            {
                /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  /* FOMB.... */
                /* 0008 */  0x8B, 0x02, 0x00, 0x00, 0x0C, 0x08, 0x00, 0x00,  /* ........ */
                /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  /* DS...}.T */
                /* 0018 */  0x18, 0xD2, 0x83, 0x00, 0x01, 0x06, 0x18, 0x42,  /* .......B */
                /* 0020 */  0x10, 0x05, 0x10, 0x8A, 0xE6, 0x80, 0x42, 0x04,  /* ......B. */
                /* 0028 */  0x92, 0x43, 0xA4, 0x30, 0x30, 0x28, 0x0B, 0x20,  /* .C.00(.  */
                /* 0030 */  0x86, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x04, 0x84,  /* ...&&@.. */
                /* 0038 */  0xBC, 0x0A, 0xB0, 0x29, 0xC0, 0x24, 0x88, 0xFA,  /* ...).$.. */
                /* 0040 */  0xF7, 0x87, 0x28, 0x09, 0x0E, 0x25, 0x04, 0x42,  /* ..(..%.B */
                /* 0048 */  0x12, 0x05, 0x98, 0x17, 0xA0, 0x5B, 0x80, 0x61,  /* .....[.a */
                /* 0050 */  0x01, 0xB6, 0x05, 0x98, 0x16, 0xE0, 0x18, 0x92,  /* ........ */
                /* 0058 */  0x4A, 0x03, 0xA7, 0x04, 0x96, 0x02, 0x21, 0xA1,  /* J.....!. */
                /* 0060 */  0x02, 0x94, 0x0B, 0xF0, 0x2D, 0x40, 0x3B, 0xA2,  /* ....-@;. */
                /* 0068 */  0x24, 0x0B, 0xB0, 0x0C, 0x23, 0x02, 0x8F, 0x82,  /* $...#... */
                /* 0070 */  0xA1, 0x71, 0x68, 0xEC, 0x30, 0x2C, 0x13, 0x4C,  /* .qh.0,.L */
                /* 0078 */  0x83, 0x38, 0x8C, 0xB2, 0x91, 0x45, 0x60, 0xDC,  /* .8...E`. */
                /* 0080 */  0x4E, 0x05, 0xC8, 0x15, 0x20, 0x4C, 0x80, 0x78,  /* N... L.x */
                /* 0088 */  0x54, 0x61, 0x34, 0x07, 0x45, 0xE0, 0x42, 0x63,  /* Ta4.E.Bc */
                /* 0090 */  0x64, 0x40, 0xC8, 0xA3, 0x00, 0xAB, 0xA3, 0xD0,  /* d@...... */
                /* 0098 */  0xA4, 0x12, 0xD8, 0xBD, 0x00, 0x8D, 0x02, 0xB4,  /* ........ */
                /* 00A0 */  0x09, 0x70, 0x28, 0x40, 0xA1, 0x00, 0x6B, 0x18,  /* .p(@..k. */
                /* 00A8 */  0x72, 0x06, 0x21, 0x5B, 0xD8, 0xC2, 0x68, 0x50,  /* r.![..hP */
                /* 00B0 */  0x80, 0x45, 0x14, 0x8D, 0xE0, 0x2C, 0x2A, 0x9E,  /* .E...,*. */
                /* 00B8 */  0x93, 0x50, 0x02, 0xDA, 0x1B, 0x82, 0xF0, 0x8C,  /* .P...... */
                /* 00C0 */  0xD9, 0x18, 0x9E, 0x10, 0x83, 0x54, 0x86, 0x21,  /* .....T.! */
                /* 00C8 */  0x88, 0xB8, 0x11, 0x8E, 0xA5, 0xFD, 0x41, 0x10,  /* ......A. */
                /* 00D0 */  0xF9, 0xAB, 0xD7, 0xB8, 0x1D, 0x69, 0x34, 0xA8,  /* .....i4. */
                /* 00D8 */  0xB1, 0x26, 0x38, 0x76, 0x8F, 0xE6, 0x84, 0x3B,  /* .&8v...; */
                /* 00E0 */  0x17, 0x20, 0x7D, 0x6E, 0x02, 0x39, 0xBA, 0xD3,  /* . }n.9.. */
                /* 00E8 */  0xA8, 0x73, 0xD0, 0x64, 0x78, 0x0C, 0x2B, 0xC1,  /* .s.dx.+. */
                /* 00F0 */  0x7F, 0x80, 0x4F, 0x01, 0x78, 0xD7, 0x80, 0x9A,  /* ..O.x... */
                /* 00F8 */  0xFE, 0xC1, 0x33, 0x41, 0x70, 0xA8, 0x21, 0x7A,  /* ..3Ap.!z */
                /* 0100 */  0xD4, 0xE1, 0x4E, 0xE0, 0xBC, 0x8E, 0x84, 0x41,  /* ..N....A */
                /* 0108 */  0x1C, 0xD1, 0x71, 0x63, 0x67, 0x75, 0x32, 0x07,  /* ..qcgu2. */
                /* 0110 */  0x5D, 0xAA, 0x00, 0xB3, 0x07, 0x00, 0x0D, 0x2E,  /* ]....... */
                /* 0118 */  0xC1, 0x69, 0x9F, 0x49, 0xE8, 0xF7, 0x80, 0xF3,  /* .i.I.... */
                /* 0120 */  0xE9, 0x79, 0x6C, 0x6C, 0x10, 0xA8, 0x91, 0xF9,  /* .yll.... */
                /* 0128 */  0xFF, 0x0F, 0xED, 0x41, 0x9E, 0x56, 0xCC, 0x90,  /* ...A.V.. */
                /* 0130 */  0xCF, 0x02, 0x87, 0xC5, 0xC4, 0x1E, 0x19, 0xE8,  /* ........ */
                /* 0138 */  0x78, 0xC0, 0x7F, 0x00, 0x78, 0x34, 0x88, 0xF0,  /* x...x4.. */
                /* 0140 */  0x66, 0xE0, 0xF9, 0x9A, 0x60, 0x50, 0x08, 0x39,  /* f...`P.9 */
                /* 0148 */  0x19, 0x0F, 0x4A, 0xCC, 0xF9, 0x80, 0xCC, 0x25,  /* ..J....% */
                /* 0150 */  0xC4, 0x43, 0xC0, 0x31, 0xC4, 0x08, 0x7A, 0x46,  /* .C.1..zF */
                /* 0158 */  0x45, 0x23, 0x6B, 0x22, 0x3E, 0x03, 0x78, 0xDC,  /* E#k">.x. */
                /* 0160 */  0x96, 0x05, 0x42, 0x09, 0x0C, 0xEC, 0x73, 0xC3,  /* ..B...s. */
                /* 0168 */  0x3B, 0x84, 0x61, 0x71, 0xA3, 0x09, 0xEC, 0xF3,  /* ;.aq.... */
                /* 0170 */  0x85, 0x05, 0x0E, 0x0A, 0x05, 0xEB, 0xBB, 0x42,  /* .......B */
                /* 0178 */  0xCC, 0xE7, 0x81, 0xE3, 0x3C, 0x60, 0x0B, 0x9F,  /* ....<`.. */
                /* 0180 */  0x28, 0x01, 0x3E, 0x24, 0x8F, 0x06, 0xDE, 0x20,  /* (.>$...  */
                /* 0188 */  0xE1, 0x5B, 0x3F, 0x02, 0x10, 0xE0, 0x27, 0x06,  /* .[?...'. */
                /* 0190 */  0x13, 0x58, 0x1E, 0x30, 0x7A, 0x94, 0xF6, 0x2B,  /* .X.0z..+ */
                /* 0198 */  0x00, 0x21, 0xF8, 0x8B, 0xC5, 0x53, 0xC0, 0xEB,  /* .!...S.. */
                /* 01A0 */  0x40, 0x84, 0x63, 0x81, 0x29, 0x72, 0x6C, 0x68,  /* @.c.)rlh */
                /* 01A8 */  0x78, 0x7E, 0x70, 0x88, 0x1E, 0xF5, 0x5C, 0xC2,  /* x~p...\. */
                /* 01B0 */  0x1F, 0x4D, 0x94, 0x53, 0x38, 0x1C, 0x1F, 0x39,  /* .M.S8..9 */
                /* 01B8 */  0x8C, 0x10, 0xFE, 0x49, 0xE3, 0xC9, 0xC3, 0x9A,  /* ...I.... */
                /* 01C0 */  0xEF, 0x00, 0x9A, 0xD2, 0x5B, 0xC0, 0xFB, 0x83,  /* ....[... */
                /* 01C8 */  0x47, 0x80, 0x11, 0x20, 0xE1, 0x68, 0x82, 0x89,  /* G.. .h.. */
                /* 01D0 */  0x7C, 0x3A, 0x01, 0xD5, 0xFF, 0xFF, 0x74, 0x02,  /* |:....t. */
                /* 01D8 */  0xB8, 0xBA, 0x01, 0x14, 0x37, 0x6A, 0x9D, 0x49,  /* ....7j.I */
                /* 01E0 */  0x7C, 0x2C, 0xF1, 0xAD, 0xE4, 0xBC, 0x43, 0xC5,  /* |,....C. */
                /* 01E8 */  0x7F, 0x93, 0x78, 0x3A, 0xF1, 0x34, 0x1E, 0x4C,  /* ..x:.4.L */
                /* 01F0 */  0x42, 0x44, 0x89, 0x18, 0x21, 0xA2, 0xEF, 0x27,  /* BD..!..' */
                /* 01F8 */  0x46, 0x08, 0x15, 0x31, 0x6C, 0xA4, 0x37, 0x80,  /* F..1l.7. */
                /* 0200 */  0xE7, 0x13, 0xE3, 0x84, 0x08, 0xF4, 0x74, 0xC2,  /* ......t. */
                /* 0208 */  0x42, 0x3E, 0x34, 0xA4, 0xE1, 0x74, 0x02, 0x50,  /* B>4..t.P */
                /* 0210 */  0xE0, 0xFF, 0x7F, 0x3A, 0x81, 0x1F, 0xF5, 0x74,  /* ...:...t */
                /* 0218 */  0x82, 0x1E, 0xAE, 0x4F, 0x19, 0x18, 0xE4, 0x03,  /* ...O.... */
                /* 0220 */  0xF2, 0xA9, 0xC3, 0xF7, 0x1F, 0x13, 0xF8, 0x78,  /* .......x */
                /* 0228 */  0xC2, 0x45, 0x1D, 0x4F, 0x50, 0xA7, 0x07, 0x1F,  /* .E.OP... */
                /* 0230 */  0x4F, 0xD8, 0x19, 0xE1, 0x2C, 0x1E, 0x03, 0x7C,  /* O...,..| */
                /* 0238 */  0x3A, 0xC1, 0xDC, 0x13, 0x7C, 0x3A, 0x01, 0xDB,  /* :...|:.. */
                /* 0240 */  0x68, 0x60, 0x1C, 0x4F, 0xC0, 0x77, 0x74, 0xC1,  /* h`.O.wt. */
                /* 0248 */  0x1D, 0x4F, 0xC0, 0x30, 0x18, 0x18, 0xE7, 0x13,  /* .O.0.... */
                /* 0250 */  0xE0, 0x31, 0x5E, 0xDC, 0x31, 0xC0, 0x43, 0xE0,  /* .1^.1.C. */
                /* 0258 */  0x03, 0x78, 0xDC, 0x38, 0x3D, 0x2B, 0x9D, 0x14,  /* .x.8=+.. */
                /* 0260 */  0xF2, 0x24, 0xC2, 0x07, 0x85, 0x39, 0xB0, 0xE0,  /* .$...9.. */
                /* 0268 */  0x14, 0xDA, 0xF4, 0xA9, 0xD1, 0xA8, 0x55, 0x83,  /* ......U. */
                /* 0270 */  0x32, 0x35, 0xCA, 0x34, 0xA8, 0xD5, 0xA7, 0x52,  /* 25.4...R */
                /* 0278 */  0x63, 0xC6, 0xCE, 0x19, 0x0E, 0xF8, 0x10, 0xD0,  /* c....... */
                /* 0280 */  0x89, 0xC0, 0xF2, 0x9E, 0x0D, 0x02, 0xB1, 0x0C,  /* ........ */
                /* 0288 */  0x0A, 0x81, 0x58, 0xFA, 0xAB, 0x45, 0x20, 0x0E,  /* ..X..E . */
                /* 0290 */  0x0E, 0xA2, 0xFF, 0x3F, 0x88, 0x23, 0xD2, 0x0A,  /* ...?.#.. */
                /* 0298 */  0xC4, 0xFF, 0x7F, 0x7F                           /* .... */
            })
        }
    }
}

