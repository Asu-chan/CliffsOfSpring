.text
.align 4
#include <asm_setup.S>

.global ToadBalloonFirstColor
ToadBalloonFirstColor:
	lis r8, TBFirstColor@h
	ori r8, r8, TBFirstColor@l
	lwz r8, 0(r8)
	stw r8, 4(r6)
	blr

.global ToadBalloonSecondColor
ToadBalloonSecondColor:
	lis r8, TBSecondColor@h
	ori r8, r8, TBSecondColor@l
	lwz r8, 0(r8)
	stw r8, 4(r6)
	blr


.data
.align 4

.global TBFirstColor
TBFirstColor: .long 0x9BD06CFF
.global TBSecondColor
TBSecondColor: .long 0xEFF2D6FF