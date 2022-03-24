.text
#include <asm_setup.S>

.global TryAndFixScoreGlitch
TryAndFixScoreGlitch:
	lwz r0, 0x4A10(r3)

	lis r8, 0x8000
	cmplw r3, r8
	bgtlr

	lwz r31, 0xC(r1)
	lwz r0, 0x14(r1)
	mtlr r0
	addi r1, r1, 0x10
	blr

.global ReplaceExceptionOccurred
ReplaceExceptionOccurred:
	lis r3, NewExceptionOccurred@h
	ori r3, r3, NewExceptionOccurred@l
	blr


.data
.align 4
NewExceptionOccurred:
.string "Whoops! SMCoS 1.0.2 has crashed.\nPlease take a screenshot of the info below\nand send it to Asu-chan#2929 on discord.\nYou can scroll through this report using the D-Pad.\n"

.global Rrun
Rrun: .string "Rrun"
