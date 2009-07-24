
obj/kernel:     file format elf32-i386


Disassembly of section .text:

f0100000 <_start-0xc>:
.long MULTIBOOT_HEADER_FLAGS
.long CHECKSUM

.globl		_start
_start:
	movw	$0x1234,0x472			# warm boot
f0100000:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
f0100006:	00 00                	add    %al,(%eax)
f0100008:	fb                   	sti    
f0100009:	4f                   	dec    %edi
f010000a:	52                   	push   %edx
f010000b:	e4 66                	in     $0x66,%al

f010000c <_start>:
f010000c:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
f0100013:	34 12 

	# Establish our own GDT in place of the boot loader's temporary GDT.
	lgdt	RELOC(mygdtdesc)		# load descriptor table
f0100015:	0f 01 15 18 90 10 00 	lgdtl  0x109018

	# Immediately reload all segment registers (including CS!)
	# with segment selectors from the new GDT.
	movl	$DATA_SEL, %eax			# Data segment selector
f010001c:	b8 10 00 00 00       	mov    $0x10,%eax
	movw	%ax,%ds				# -> DS: Data Segment
f0100021:	8e d8                	mov    %eax,%ds
	movw	%ax,%es				# -> ES: Extra Segment
f0100023:	8e c0                	mov    %eax,%es
	movw	%ax,%ss				# -> SS: Stack Segment
f0100025:	8e d0                	mov    %eax,%ss
	ljmp	$CODE_SEL,$relocated		# reload CS by jumping
f0100027:	ea 2e 00 10 f0 08 00 	ljmp   $0x8,$0xf010002e

f010002e <relocated>:
relocated:

	# Clear the frame pointer register (EBP)
	# so that once we get into debugging C code,
	# stack backtraces will be terminated properly.
	movl	$0x0,%ebp			# nuke frame pointer
f010002e:	bd 00 00 00 00       	mov    $0x0,%ebp

        # Set the stack pointer
	movl	$(bootstacktop),%esp
f0100033:	bc 00 90 10 f0       	mov    $0xf0109000,%esp

	# now to C code
	call	i386_init
f0100038:	e8 80 90 00 00       	call   f01090bd <i386_init>

f010003d <spin>:

	# Should never get here, but in case we do, just spin.
spin:	jmp	spin
f010003d:	eb fe                	jmp    f010003d <spin>
f010003f:	90                   	nop
f0100040:	90                   	nop
f0100041:	90                   	nop
f0100042:	90                   	nop
f0100043:	90                   	nop
f0100044:	90                   	nop
f0100045:	90                   	nop
f0100046:	90                   	nop
f0100047:	90                   	nop
f0100048:	90                   	nop
f0100049:	90                   	nop
f010004a:	90                   	nop
f010004b:	90                   	nop
f010004c:	90                   	nop
f010004d:	90                   	nop
f010004e:	90                   	nop
f010004f:	90                   	nop
f0100050:	90                   	nop
f0100051:	90                   	nop
f0100052:	90                   	nop
f0100053:	90                   	nop
f0100054:	90                   	nop
f0100055:	90                   	nop
f0100056:	90                   	nop
f0100057:	90                   	nop
f0100058:	90                   	nop
f0100059:	90                   	nop
f010005a:	90                   	nop
f010005b:	90                   	nop
f010005c:	90                   	nop
f010005d:	90                   	nop
f010005e:	90                   	nop
f010005f:	90                   	nop
f0100060:	90                   	nop
f0100061:	90                   	nop
f0100062:	90                   	nop
f0100063:	90                   	nop
f0100064:	90                   	nop
f0100065:	90                   	nop
f0100066:	90                   	nop
f0100067:	90                   	nop
f0100068:	90                   	nop
f0100069:	90                   	nop
f010006a:	90                   	nop
f010006b:	90                   	nop
f010006c:	90                   	nop
f010006d:	90                   	nop
f010006e:	90                   	nop
f010006f:	90                   	nop
f0100070:	90                   	nop
f0100071:	90                   	nop
f0100072:	90                   	nop
f0100073:	90                   	nop
f0100074:	90                   	nop
f0100075:	90                   	nop
f0100076:	90                   	nop
f0100077:	90                   	nop
f0100078:	90                   	nop
f0100079:	90                   	nop
f010007a:	90                   	nop
f010007b:	90                   	nop
f010007c:	90                   	nop
f010007d:	90                   	nop
f010007e:	90                   	nop
f010007f:	90                   	nop
f0100080:	90                   	nop
f0100081:	90                   	nop
f0100082:	90                   	nop
f0100083:	90                   	nop
f0100084:	90                   	nop
f0100085:	90                   	nop
f0100086:	90                   	nop
f0100087:	90                   	nop
f0100088:	90                   	nop
f0100089:	90                   	nop
f010008a:	90                   	nop
f010008b:	90                   	nop
f010008c:	90                   	nop
f010008d:	90                   	nop
f010008e:	90                   	nop
f010008f:	90                   	nop
f0100090:	90                   	nop
f0100091:	90                   	nop
f0100092:	90                   	nop
f0100093:	90                   	nop
f0100094:	90                   	nop
f0100095:	90                   	nop
f0100096:	90                   	nop
f0100097:	90                   	nop
f0100098:	90                   	nop
f0100099:	90                   	nop
f010009a:	90                   	nop
f010009b:	90                   	nop
f010009c:	90                   	nop
f010009d:	90                   	nop
f010009e:	90                   	nop
f010009f:	90                   	nop
f01000a0:	90                   	nop
f01000a1:	90                   	nop
f01000a2:	90                   	nop
f01000a3:	90                   	nop
f01000a4:	90                   	nop
f01000a5:	90                   	nop
f01000a6:	90                   	nop
f01000a7:	90                   	nop
f01000a8:	90                   	nop
f01000a9:	90                   	nop
f01000aa:	90                   	nop
f01000ab:	90                   	nop
f01000ac:	90                   	nop
f01000ad:	90                   	nop
f01000ae:	90                   	nop
f01000af:	90                   	nop
f01000b0:	90                   	nop
f01000b1:	90                   	nop
f01000b2:	90                   	nop
f01000b3:	90                   	nop
f01000b4:	90                   	nop
f01000b5:	90                   	nop
f01000b6:	90                   	nop
f01000b7:	90                   	nop
f01000b8:	90                   	nop
f01000b9:	90                   	nop
f01000ba:	90                   	nop
f01000bb:	90                   	nop
f01000bc:	90                   	nop
f01000bd:	90                   	nop
f01000be:	90                   	nop
f01000bf:	90                   	nop
f01000c0:	90                   	nop
f01000c1:	90                   	nop
f01000c2:	90                   	nop
f01000c3:	90                   	nop
f01000c4:	90                   	nop
f01000c5:	90                   	nop
f01000c6:	90                   	nop
f01000c7:	90                   	nop
f01000c8:	90                   	nop
f01000c9:	90                   	nop
f01000ca:	90                   	nop
f01000cb:	90                   	nop
f01000cc:	90                   	nop
f01000cd:	90                   	nop
f01000ce:	90                   	nop
f01000cf:	90                   	nop
f01000d0:	90                   	nop
f01000d1:	90                   	nop
f01000d2:	90                   	nop
f01000d3:	90                   	nop
f01000d4:	90                   	nop
f01000d5:	90                   	nop
f01000d6:	90                   	nop
f01000d7:	90                   	nop
f01000d8:	90                   	nop
f01000d9:	90                   	nop
f01000da:	90                   	nop
f01000db:	90                   	nop
f01000dc:	90                   	nop
f01000dd:	90                   	nop
f01000de:	90                   	nop
f01000df:	90                   	nop
f01000e0:	90                   	nop
f01000e1:	90                   	nop
f01000e2:	90                   	nop
f01000e3:	90                   	nop
f01000e4:	90                   	nop
f01000e5:	90                   	nop
f01000e6:	90                   	nop
f01000e7:	90                   	nop
f01000e8:	90                   	nop
f01000e9:	90                   	nop
f01000ea:	90                   	nop
f01000eb:	90                   	nop
f01000ec:	90                   	nop
f01000ed:	90                   	nop
f01000ee:	90                   	nop
f01000ef:	90                   	nop
f01000f0:	90                   	nop
f01000f1:	90                   	nop
f01000f2:	90                   	nop
f01000f3:	90                   	nop
f01000f4:	90                   	nop
f01000f5:	90                   	nop
f01000f6:	90                   	nop
f01000f7:	90                   	nop
f01000f8:	90                   	nop
f01000f9:	90                   	nop
f01000fa:	90                   	nop
f01000fb:	90                   	nop
f01000fc:	90                   	nop
f01000fd:	90                   	nop
f01000fe:	90                   	nop
f01000ff:	90                   	nop
f0100100:	90                   	nop
f0100101:	90                   	nop
f0100102:	90                   	nop
f0100103:	90                   	nop
f0100104:	90                   	nop
f0100105:	90                   	nop
f0100106:	90                   	nop
f0100107:	90                   	nop
f0100108:	90                   	nop
f0100109:	90                   	nop
f010010a:	90                   	nop
f010010b:	90                   	nop
f010010c:	90                   	nop
f010010d:	90                   	nop
f010010e:	90                   	nop
f010010f:	90                   	nop
f0100110:	90                   	nop
f0100111:	90                   	nop
f0100112:	90                   	nop
f0100113:	90                   	nop
f0100114:	90                   	nop
f0100115:	90                   	nop
f0100116:	90                   	nop
f0100117:	90                   	nop
f0100118:	90                   	nop
f0100119:	90                   	nop
f010011a:	90                   	nop
f010011b:	90                   	nop
f010011c:	90                   	nop
f010011d:	90                   	nop
f010011e:	90                   	nop
f010011f:	90                   	nop
f0100120:	90                   	nop
f0100121:	90                   	nop
f0100122:	90                   	nop
f0100123:	90                   	nop
f0100124:	90                   	nop
f0100125:	90                   	nop
f0100126:	90                   	nop
f0100127:	90                   	nop
f0100128:	90                   	nop
f0100129:	90                   	nop
f010012a:	90                   	nop
f010012b:	90                   	nop
f010012c:	90                   	nop
f010012d:	90                   	nop
f010012e:	90                   	nop
f010012f:	90                   	nop
f0100130:	90                   	nop
f0100131:	90                   	nop
f0100132:	90                   	nop
f0100133:	90                   	nop
f0100134:	90                   	nop
f0100135:	90                   	nop
f0100136:	90                   	nop
f0100137:	90                   	nop
f0100138:	90                   	nop
f0100139:	90                   	nop
f010013a:	90                   	nop
f010013b:	90                   	nop
f010013c:	90                   	nop
f010013d:	90                   	nop
f010013e:	90                   	nop
f010013f:	90                   	nop
f0100140:	90                   	nop
f0100141:	90                   	nop
f0100142:	90                   	nop
f0100143:	90                   	nop
f0100144:	90                   	nop
f0100145:	90                   	nop
f0100146:	90                   	nop
f0100147:	90                   	nop
f0100148:	90                   	nop
f0100149:	90                   	nop
f010014a:	90                   	nop
f010014b:	90                   	nop
f010014c:	90                   	nop
f010014d:	90                   	nop
f010014e:	90                   	nop
f010014f:	90                   	nop
f0100150:	90                   	nop
f0100151:	90                   	nop
f0100152:	90                   	nop
f0100153:	90                   	nop
f0100154:	90                   	nop
f0100155:	90                   	nop
f0100156:	90                   	nop
f0100157:	90                   	nop
f0100158:	90                   	nop
f0100159:	90                   	nop
f010015a:	90                   	nop
f010015b:	90                   	nop
f010015c:	90                   	nop
f010015d:	90                   	nop
f010015e:	90                   	nop
f010015f:	90                   	nop
f0100160:	90                   	nop
f0100161:	90                   	nop
f0100162:	90                   	nop
f0100163:	90                   	nop
f0100164:	90                   	nop
f0100165:	90                   	nop
f0100166:	90                   	nop
f0100167:	90                   	nop
f0100168:	90                   	nop
f0100169:	90                   	nop
f010016a:	90                   	nop
f010016b:	90                   	nop
f010016c:	90                   	nop
f010016d:	90                   	nop
f010016e:	90                   	nop
f010016f:	90                   	nop
f0100170:	90                   	nop
f0100171:	90                   	nop
f0100172:	90                   	nop
f0100173:	90                   	nop
f0100174:	90                   	nop
f0100175:	90                   	nop
f0100176:	90                   	nop
f0100177:	90                   	nop
f0100178:	90                   	nop
f0100179:	90                   	nop
f010017a:	90                   	nop
f010017b:	90                   	nop
f010017c:	90                   	nop
f010017d:	90                   	nop
f010017e:	90                   	nop
f010017f:	90                   	nop
f0100180:	90                   	nop
f0100181:	90                   	nop
f0100182:	90                   	nop
f0100183:	90                   	nop
f0100184:	90                   	nop
f0100185:	90                   	nop
f0100186:	90                   	nop
f0100187:	90                   	nop
f0100188:	90                   	nop
f0100189:	90                   	nop
f010018a:	90                   	nop
f010018b:	90                   	nop
f010018c:	90                   	nop
f010018d:	90                   	nop
f010018e:	90                   	nop
f010018f:	90                   	nop
f0100190:	90                   	nop
f0100191:	90                   	nop
f0100192:	90                   	nop
f0100193:	90                   	nop
f0100194:	90                   	nop
f0100195:	90                   	nop
f0100196:	90                   	nop
f0100197:	90                   	nop
f0100198:	90                   	nop
f0100199:	90                   	nop
f010019a:	90                   	nop
f010019b:	90                   	nop
f010019c:	90                   	nop
f010019d:	90                   	nop
f010019e:	90                   	nop
f010019f:	90                   	nop
f01001a0:	90                   	nop
f01001a1:	90                   	nop
f01001a2:	90                   	nop
f01001a3:	90                   	nop
f01001a4:	90                   	nop
f01001a5:	90                   	nop
f01001a6:	90                   	nop
f01001a7:	90                   	nop
f01001a8:	90                   	nop
f01001a9:	90                   	nop
f01001aa:	90                   	nop
f01001ab:	90                   	nop
f01001ac:	90                   	nop
f01001ad:	90                   	nop
f01001ae:	90                   	nop
f01001af:	90                   	nop
f01001b0:	90                   	nop
f01001b1:	90                   	nop
f01001b2:	90                   	nop
f01001b3:	90                   	nop
f01001b4:	90                   	nop
f01001b5:	90                   	nop
f01001b6:	90                   	nop
f01001b7:	90                   	nop
f01001b8:	90                   	nop
f01001b9:	90                   	nop
f01001ba:	90                   	nop
f01001bb:	90                   	nop
f01001bc:	90                   	nop
f01001bd:	90                   	nop
f01001be:	90                   	nop
f01001bf:	90                   	nop
f01001c0:	90                   	nop
f01001c1:	90                   	nop
f01001c2:	90                   	nop
f01001c3:	90                   	nop
f01001c4:	90                   	nop
f01001c5:	90                   	nop
f01001c6:	90                   	nop
f01001c7:	90                   	nop
f01001c8:	90                   	nop
f01001c9:	90                   	nop
f01001ca:	90                   	nop
f01001cb:	90                   	nop
f01001cc:	90                   	nop
f01001cd:	90                   	nop
f01001ce:	90                   	nop
f01001cf:	90                   	nop
f01001d0:	90                   	nop
f01001d1:	90                   	nop
f01001d2:	90                   	nop
f01001d3:	90                   	nop
f01001d4:	90                   	nop
f01001d5:	90                   	nop
f01001d6:	90                   	nop
f01001d7:	90                   	nop
f01001d8:	90                   	nop
f01001d9:	90                   	nop
f01001da:	90                   	nop
f01001db:	90                   	nop
f01001dc:	90                   	nop
f01001dd:	90                   	nop
f01001de:	90                   	nop
f01001df:	90                   	nop
f01001e0:	90                   	nop
f01001e1:	90                   	nop
f01001e2:	90                   	nop
f01001e3:	90                   	nop
f01001e4:	90                   	nop
f01001e5:	90                   	nop
f01001e6:	90                   	nop
f01001e7:	90                   	nop
f01001e8:	90                   	nop
f01001e9:	90                   	nop
f01001ea:	90                   	nop
f01001eb:	90                   	nop
f01001ec:	90                   	nop
f01001ed:	90                   	nop
f01001ee:	90                   	nop
f01001ef:	90                   	nop
f01001f0:	90                   	nop
f01001f1:	90                   	nop
f01001f2:	90                   	nop
f01001f3:	90                   	nop
f01001f4:	90                   	nop
f01001f5:	90                   	nop
f01001f6:	90                   	nop
f01001f7:	90                   	nop
f01001f8:	90                   	nop
f01001f9:	90                   	nop
f01001fa:	90                   	nop
f01001fb:	90                   	nop
f01001fc:	90                   	nop
f01001fd:	90                   	nop
f01001fe:	90                   	nop
f01001ff:	90                   	nop
f0100200:	90                   	nop
f0100201:	90                   	nop
f0100202:	90                   	nop
f0100203:	90                   	nop
f0100204:	90                   	nop
f0100205:	90                   	nop
f0100206:	90                   	nop
f0100207:	90                   	nop
f0100208:	90                   	nop
f0100209:	90                   	nop
f010020a:	90                   	nop
f010020b:	90                   	nop
f010020c:	90                   	nop
f010020d:	90                   	nop
f010020e:	90                   	nop
f010020f:	90                   	nop
f0100210:	90                   	nop
f0100211:	90                   	nop
f0100212:	90                   	nop
f0100213:	90                   	nop
f0100214:	90                   	nop
f0100215:	90                   	nop
f0100216:	90                   	nop
f0100217:	90                   	nop
f0100218:	90                   	nop
f0100219:	90                   	nop
f010021a:	90                   	nop
f010021b:	90                   	nop
f010021c:	90                   	nop
f010021d:	90                   	nop
f010021e:	90                   	nop
f010021f:	90                   	nop
f0100220:	90                   	nop
f0100221:	90                   	nop
f0100222:	90                   	nop
f0100223:	90                   	nop
f0100224:	90                   	nop
f0100225:	90                   	nop
f0100226:	90                   	nop
f0100227:	90                   	nop
f0100228:	90                   	nop
f0100229:	90                   	nop
f010022a:	90                   	nop
f010022b:	90                   	nop
f010022c:	90                   	nop
f010022d:	90                   	nop
f010022e:	90                   	nop
f010022f:	90                   	nop
f0100230:	90                   	nop
f0100231:	90                   	nop
f0100232:	90                   	nop
f0100233:	90                   	nop
f0100234:	90                   	nop
f0100235:	90                   	nop
f0100236:	90                   	nop
f0100237:	90                   	nop
f0100238:	90                   	nop
f0100239:	90                   	nop
f010023a:	90                   	nop
f010023b:	90                   	nop
f010023c:	90                   	nop
f010023d:	90                   	nop
f010023e:	90                   	nop
f010023f:	90                   	nop
f0100240:	90                   	nop
f0100241:	90                   	nop
f0100242:	90                   	nop
f0100243:	90                   	nop
f0100244:	90                   	nop
f0100245:	90                   	nop
f0100246:	90                   	nop
f0100247:	90                   	nop
f0100248:	90                   	nop
f0100249:	90                   	nop
f010024a:	90                   	nop
f010024b:	90                   	nop
f010024c:	90                   	nop
f010024d:	90                   	nop
f010024e:	90                   	nop
f010024f:	90                   	nop
f0100250:	90                   	nop
f0100251:	90                   	nop
f0100252:	90                   	nop
f0100253:	90                   	nop
f0100254:	90                   	nop
f0100255:	90                   	nop
f0100256:	90                   	nop
f0100257:	90                   	nop
f0100258:	90                   	nop
f0100259:	90                   	nop
f010025a:	90                   	nop
f010025b:	90                   	nop
f010025c:	90                   	nop
f010025d:	90                   	nop
f010025e:	90                   	nop
f010025f:	90                   	nop
f0100260:	90                   	nop
f0100261:	90                   	nop
f0100262:	90                   	nop
f0100263:	90                   	nop
f0100264:	90                   	nop
f0100265:	90                   	nop
f0100266:	90                   	nop
f0100267:	90                   	nop
f0100268:	90                   	nop
f0100269:	90                   	nop
f010026a:	90                   	nop
f010026b:	90                   	nop
f010026c:	90                   	nop
f010026d:	90                   	nop
f010026e:	90                   	nop
f010026f:	90                   	nop
f0100270:	90                   	nop
f0100271:	90                   	nop
f0100272:	90                   	nop
f0100273:	90                   	nop
f0100274:	90                   	nop
f0100275:	90                   	nop
f0100276:	90                   	nop
f0100277:	90                   	nop
f0100278:	90                   	nop
f0100279:	90                   	nop
f010027a:	90                   	nop
f010027b:	90                   	nop
f010027c:	90                   	nop
f010027d:	90                   	nop
f010027e:	90                   	nop
f010027f:	90                   	nop
f0100280:	90                   	nop
f0100281:	90                   	nop
f0100282:	90                   	nop
f0100283:	90                   	nop
f0100284:	90                   	nop
f0100285:	90                   	nop
f0100286:	90                   	nop
f0100287:	90                   	nop
f0100288:	90                   	nop
f0100289:	90                   	nop
f010028a:	90                   	nop
f010028b:	90                   	nop
f010028c:	90                   	nop
f010028d:	90                   	nop
f010028e:	90                   	nop
f010028f:	90                   	nop
f0100290:	90                   	nop
f0100291:	90                   	nop
f0100292:	90                   	nop
f0100293:	90                   	nop
f0100294:	90                   	nop
f0100295:	90                   	nop
f0100296:	90                   	nop
f0100297:	90                   	nop
f0100298:	90                   	nop
f0100299:	90                   	nop
f010029a:	90                   	nop
f010029b:	90                   	nop
f010029c:	90                   	nop
f010029d:	90                   	nop
f010029e:	90                   	nop
f010029f:	90                   	nop
f01002a0:	90                   	nop
f01002a1:	90                   	nop
f01002a2:	90                   	nop
f01002a3:	90                   	nop
f01002a4:	90                   	nop
f01002a5:	90                   	nop
f01002a6:	90                   	nop
f01002a7:	90                   	nop
f01002a8:	90                   	nop
f01002a9:	90                   	nop
f01002aa:	90                   	nop
f01002ab:	90                   	nop
f01002ac:	90                   	nop
f01002ad:	90                   	nop
f01002ae:	90                   	nop
f01002af:	90                   	nop
f01002b0:	90                   	nop
f01002b1:	90                   	nop
f01002b2:	90                   	nop
f01002b3:	90                   	nop
f01002b4:	90                   	nop
f01002b5:	90                   	nop
f01002b6:	90                   	nop
f01002b7:	90                   	nop
f01002b8:	90                   	nop
f01002b9:	90                   	nop
f01002ba:	90                   	nop
f01002bb:	90                   	nop
f01002bc:	90                   	nop
f01002bd:	90                   	nop
f01002be:	90                   	nop
f01002bf:	90                   	nop
f01002c0:	90                   	nop
f01002c1:	90                   	nop
f01002c2:	90                   	nop
f01002c3:	90                   	nop
f01002c4:	90                   	nop
f01002c5:	90                   	nop
f01002c6:	90                   	nop
f01002c7:	90                   	nop
f01002c8:	90                   	nop
f01002c9:	90                   	nop
f01002ca:	90                   	nop
f01002cb:	90                   	nop
f01002cc:	90                   	nop
f01002cd:	90                   	nop
f01002ce:	90                   	nop
f01002cf:	90                   	nop
f01002d0:	90                   	nop
f01002d1:	90                   	nop
f01002d2:	90                   	nop
f01002d3:	90                   	nop
f01002d4:	90                   	nop
f01002d5:	90                   	nop
f01002d6:	90                   	nop
f01002d7:	90                   	nop
f01002d8:	90                   	nop
f01002d9:	90                   	nop
f01002da:	90                   	nop
f01002db:	90                   	nop
f01002dc:	90                   	nop
f01002dd:	90                   	nop
f01002de:	90                   	nop
f01002df:	90                   	nop
f01002e0:	90                   	nop
f01002e1:	90                   	nop
f01002e2:	90                   	nop
f01002e3:	90                   	nop
f01002e4:	90                   	nop
f01002e5:	90                   	nop
f01002e6:	90                   	nop
f01002e7:	90                   	nop
f01002e8:	90                   	nop
f01002e9:	90                   	nop
f01002ea:	90                   	nop
f01002eb:	90                   	nop
f01002ec:	90                   	nop
f01002ed:	90                   	nop
f01002ee:	90                   	nop
f01002ef:	90                   	nop
f01002f0:	90                   	nop
f01002f1:	90                   	nop
f01002f2:	90                   	nop
f01002f3:	90                   	nop
f01002f4:	90                   	nop
f01002f5:	90                   	nop
f01002f6:	90                   	nop
f01002f7:	90                   	nop
f01002f8:	90                   	nop
f01002f9:	90                   	nop
f01002fa:	90                   	nop
f01002fb:	90                   	nop
f01002fc:	90                   	nop
f01002fd:	90                   	nop
f01002fe:	90                   	nop
f01002ff:	90                   	nop
f0100300:	90                   	nop
f0100301:	90                   	nop
f0100302:	90                   	nop
f0100303:	90                   	nop
f0100304:	90                   	nop
f0100305:	90                   	nop
f0100306:	90                   	nop
f0100307:	90                   	nop
f0100308:	90                   	nop
f0100309:	90                   	nop
f010030a:	90                   	nop
f010030b:	90                   	nop
f010030c:	90                   	nop
f010030d:	90                   	nop
f010030e:	90                   	nop
f010030f:	90                   	nop
f0100310:	90                   	nop
f0100311:	90                   	nop
f0100312:	90                   	nop
f0100313:	90                   	nop
f0100314:	90                   	nop
f0100315:	90                   	nop
f0100316:	90                   	nop
f0100317:	90                   	nop
f0100318:	90                   	nop
f0100319:	90                   	nop
f010031a:	90                   	nop
f010031b:	90                   	nop
f010031c:	90                   	nop
f010031d:	90                   	nop
f010031e:	90                   	nop
f010031f:	90                   	nop
f0100320:	90                   	nop
f0100321:	90                   	nop
f0100322:	90                   	nop
f0100323:	90                   	nop
f0100324:	90                   	nop
f0100325:	90                   	nop
f0100326:	90                   	nop
f0100327:	90                   	nop
f0100328:	90                   	nop
f0100329:	90                   	nop
f010032a:	90                   	nop
f010032b:	90                   	nop
f010032c:	90                   	nop
f010032d:	90                   	nop
f010032e:	90                   	nop
f010032f:	90                   	nop
f0100330:	90                   	nop
f0100331:	90                   	nop
f0100332:	90                   	nop
f0100333:	90                   	nop
f0100334:	90                   	nop
f0100335:	90                   	nop
f0100336:	90                   	nop
f0100337:	90                   	nop
f0100338:	90                   	nop
f0100339:	90                   	nop
f010033a:	90                   	nop
f010033b:	90                   	nop
f010033c:	90                   	nop
f010033d:	90                   	nop
f010033e:	90                   	nop
f010033f:	90                   	nop
f0100340:	90                   	nop
f0100341:	90                   	nop
f0100342:	90                   	nop
f0100343:	90                   	nop
f0100344:	90                   	nop
f0100345:	90                   	nop
f0100346:	90                   	nop
f0100347:	90                   	nop
f0100348:	90                   	nop
f0100349:	90                   	nop
f010034a:	90                   	nop
f010034b:	90                   	nop
f010034c:	90                   	nop
f010034d:	90                   	nop
f010034e:	90                   	nop
f010034f:	90                   	nop
f0100350:	90                   	nop
f0100351:	90                   	nop
f0100352:	90                   	nop
f0100353:	90                   	nop
f0100354:	90                   	nop
f0100355:	90                   	nop
f0100356:	90                   	nop
f0100357:	90                   	nop
f0100358:	90                   	nop
f0100359:	90                   	nop
f010035a:	90                   	nop
f010035b:	90                   	nop
f010035c:	90                   	nop
f010035d:	90                   	nop
f010035e:	90                   	nop
f010035f:	90                   	nop
f0100360:	90                   	nop
f0100361:	90                   	nop
f0100362:	90                   	nop
f0100363:	90                   	nop
f0100364:	90                   	nop
f0100365:	90                   	nop
f0100366:	90                   	nop
f0100367:	90                   	nop
f0100368:	90                   	nop
f0100369:	90                   	nop
f010036a:	90                   	nop
f010036b:	90                   	nop
f010036c:	90                   	nop
f010036d:	90                   	nop
f010036e:	90                   	nop
f010036f:	90                   	nop
f0100370:	90                   	nop
f0100371:	90                   	nop
f0100372:	90                   	nop
f0100373:	90                   	nop
f0100374:	90                   	nop
f0100375:	90                   	nop
f0100376:	90                   	nop
f0100377:	90                   	nop
f0100378:	90                   	nop
f0100379:	90                   	nop
f010037a:	90                   	nop
f010037b:	90                   	nop
f010037c:	90                   	nop
f010037d:	90                   	nop
f010037e:	90                   	nop
f010037f:	90                   	nop
f0100380:	90                   	nop
f0100381:	90                   	nop
f0100382:	90                   	nop
f0100383:	90                   	nop
f0100384:	90                   	nop
f0100385:	90                   	nop
f0100386:	90                   	nop
f0100387:	90                   	nop
f0100388:	90                   	nop
f0100389:	90                   	nop
f010038a:	90                   	nop
f010038b:	90                   	nop
f010038c:	90                   	nop
f010038d:	90                   	nop
f010038e:	90                   	nop
f010038f:	90                   	nop
f0100390:	90                   	nop
f0100391:	90                   	nop
f0100392:	90                   	nop
f0100393:	90                   	nop
f0100394:	90                   	nop
f0100395:	90                   	nop
f0100396:	90                   	nop
f0100397:	90                   	nop
f0100398:	90                   	nop
f0100399:	90                   	nop
f010039a:	90                   	nop
f010039b:	90                   	nop
f010039c:	90                   	nop
f010039d:	90                   	nop
f010039e:	90                   	nop
f010039f:	90                   	nop
f01003a0:	90                   	nop
f01003a1:	90                   	nop
f01003a2:	90                   	nop
f01003a3:	90                   	nop
f01003a4:	90                   	nop
f01003a5:	90                   	nop
f01003a6:	90                   	nop
f01003a7:	90                   	nop
f01003a8:	90                   	nop
f01003a9:	90                   	nop
f01003aa:	90                   	nop
f01003ab:	90                   	nop
f01003ac:	90                   	nop
f01003ad:	90                   	nop
f01003ae:	90                   	nop
f01003af:	90                   	nop
f01003b0:	90                   	nop
f01003b1:	90                   	nop
f01003b2:	90                   	nop
f01003b3:	90                   	nop
f01003b4:	90                   	nop
f01003b5:	90                   	nop
f01003b6:	90                   	nop
f01003b7:	90                   	nop
f01003b8:	90                   	nop
f01003b9:	90                   	nop
f01003ba:	90                   	nop
f01003bb:	90                   	nop
f01003bc:	90                   	nop
f01003bd:	90                   	nop
f01003be:	90                   	nop
f01003bf:	90                   	nop
f01003c0:	90                   	nop
f01003c1:	90                   	nop
f01003c2:	90                   	nop
f01003c3:	90                   	nop
f01003c4:	90                   	nop
f01003c5:	90                   	nop
f01003c6:	90                   	nop
f01003c7:	90                   	nop
f01003c8:	90                   	nop
f01003c9:	90                   	nop
f01003ca:	90                   	nop
f01003cb:	90                   	nop
f01003cc:	90                   	nop
f01003cd:	90                   	nop
f01003ce:	90                   	nop
f01003cf:	90                   	nop
f01003d0:	90                   	nop
f01003d1:	90                   	nop
f01003d2:	90                   	nop
f01003d3:	90                   	nop
f01003d4:	90                   	nop
f01003d5:	90                   	nop
f01003d6:	90                   	nop
f01003d7:	90                   	nop
f01003d8:	90                   	nop
f01003d9:	90                   	nop
f01003da:	90                   	nop
f01003db:	90                   	nop
f01003dc:	90                   	nop
f01003dd:	90                   	nop
f01003de:	90                   	nop
f01003df:	90                   	nop
f01003e0:	90                   	nop
f01003e1:	90                   	nop
f01003e2:	90                   	nop
f01003e3:	90                   	nop
f01003e4:	90                   	nop
f01003e5:	90                   	nop
f01003e6:	90                   	nop
f01003e7:	90                   	nop
f01003e8:	90                   	nop
f01003e9:	90                   	nop
f01003ea:	90                   	nop
f01003eb:	90                   	nop
f01003ec:	90                   	nop
f01003ed:	90                   	nop
f01003ee:	90                   	nop
f01003ef:	90                   	nop
f01003f0:	90                   	nop
f01003f1:	90                   	nop
f01003f2:	90                   	nop
f01003f3:	90                   	nop
f01003f4:	90                   	nop
f01003f5:	90                   	nop
f01003f6:	90                   	nop
f01003f7:	90                   	nop
f01003f8:	90                   	nop
f01003f9:	90                   	nop
f01003fa:	90                   	nop
f01003fb:	90                   	nop
f01003fc:	90                   	nop
f01003fd:	90                   	nop
f01003fe:	90                   	nop
f01003ff:	90                   	nop
f0100400:	90                   	nop
f0100401:	90                   	nop
f0100402:	90                   	nop
f0100403:	90                   	nop
f0100404:	90                   	nop
f0100405:	90                   	nop
f0100406:	90                   	nop
f0100407:	90                   	nop
f0100408:	90                   	nop
f0100409:	90                   	nop
f010040a:	90                   	nop
f010040b:	90                   	nop
f010040c:	90                   	nop
f010040d:	90                   	nop
f010040e:	90                   	nop
f010040f:	90                   	nop
f0100410:	90                   	nop
f0100411:	90                   	nop
f0100412:	90                   	nop
f0100413:	90                   	nop
f0100414:	90                   	nop
f0100415:	90                   	nop
f0100416:	90                   	nop
f0100417:	90                   	nop
f0100418:	90                   	nop
f0100419:	90                   	nop
f010041a:	90                   	nop
f010041b:	90                   	nop
f010041c:	90                   	nop
f010041d:	90                   	nop
f010041e:	90                   	nop
f010041f:	90                   	nop
f0100420:	90                   	nop
f0100421:	90                   	nop
f0100422:	90                   	nop
f0100423:	90                   	nop
f0100424:	90                   	nop
f0100425:	90                   	nop
f0100426:	90                   	nop
f0100427:	90                   	nop
f0100428:	90                   	nop
f0100429:	90                   	nop
f010042a:	90                   	nop
f010042b:	90                   	nop
f010042c:	90                   	nop
f010042d:	90                   	nop
f010042e:	90                   	nop
f010042f:	90                   	nop
f0100430:	90                   	nop
f0100431:	90                   	nop
f0100432:	90                   	nop
f0100433:	90                   	nop
f0100434:	90                   	nop
f0100435:	90                   	nop
f0100436:	90                   	nop
f0100437:	90                   	nop
f0100438:	90                   	nop
f0100439:	90                   	nop
f010043a:	90                   	nop
f010043b:	90                   	nop
f010043c:	90                   	nop
f010043d:	90                   	nop
f010043e:	90                   	nop
f010043f:	90                   	nop
f0100440:	90                   	nop
f0100441:	90                   	nop
f0100442:	90                   	nop
f0100443:	90                   	nop
f0100444:	90                   	nop
f0100445:	90                   	nop
f0100446:	90                   	nop
f0100447:	90                   	nop
f0100448:	90                   	nop
f0100449:	90                   	nop
f010044a:	90                   	nop
f010044b:	90                   	nop
f010044c:	90                   	nop
f010044d:	90                   	nop
f010044e:	90                   	nop
f010044f:	90                   	nop
f0100450:	90                   	nop
f0100451:	90                   	nop
f0100452:	90                   	nop
f0100453:	90                   	nop
f0100454:	90                   	nop
f0100455:	90                   	nop
f0100456:	90                   	nop
f0100457:	90                   	nop
f0100458:	90                   	nop
f0100459:	90                   	nop
f010045a:	90                   	nop
f010045b:	90                   	nop
f010045c:	90                   	nop
f010045d:	90                   	nop
f010045e:	90                   	nop
f010045f:	90                   	nop
f0100460:	90                   	nop
f0100461:	90                   	nop
f0100462:	90                   	nop
f0100463:	90                   	nop
f0100464:	90                   	nop
f0100465:	90                   	nop
f0100466:	90                   	nop
f0100467:	90                   	nop
f0100468:	90                   	nop
f0100469:	90                   	nop
f010046a:	90                   	nop
f010046b:	90                   	nop
f010046c:	90                   	nop
f010046d:	90                   	nop
f010046e:	90                   	nop
f010046f:	90                   	nop
f0100470:	90                   	nop
f0100471:	90                   	nop
f0100472:	90                   	nop
f0100473:	90                   	nop
f0100474:	90                   	nop
f0100475:	90                   	nop
f0100476:	90                   	nop
f0100477:	90                   	nop
f0100478:	90                   	nop
f0100479:	90                   	nop
f010047a:	90                   	nop
f010047b:	90                   	nop
f010047c:	90                   	nop
f010047d:	90                   	nop
f010047e:	90                   	nop
f010047f:	90                   	nop
f0100480:	90                   	nop
f0100481:	90                   	nop
f0100482:	90                   	nop
f0100483:	90                   	nop
f0100484:	90                   	nop
f0100485:	90                   	nop
f0100486:	90                   	nop
f0100487:	90                   	nop
f0100488:	90                   	nop
f0100489:	90                   	nop
f010048a:	90                   	nop
f010048b:	90                   	nop
f010048c:	90                   	nop
f010048d:	90                   	nop
f010048e:	90                   	nop
f010048f:	90                   	nop
f0100490:	90                   	nop
f0100491:	90                   	nop
f0100492:	90                   	nop
f0100493:	90                   	nop
f0100494:	90                   	nop
f0100495:	90                   	nop
f0100496:	90                   	nop
f0100497:	90                   	nop
f0100498:	90                   	nop
f0100499:	90                   	nop
f010049a:	90                   	nop
f010049b:	90                   	nop
f010049c:	90                   	nop
f010049d:	90                   	nop
f010049e:	90                   	nop
f010049f:	90                   	nop
f01004a0:	90                   	nop
f01004a1:	90                   	nop
f01004a2:	90                   	nop
f01004a3:	90                   	nop
f01004a4:	90                   	nop
f01004a5:	90                   	nop
f01004a6:	90                   	nop
f01004a7:	90                   	nop
f01004a8:	90                   	nop
f01004a9:	90                   	nop
f01004aa:	90                   	nop
f01004ab:	90                   	nop
f01004ac:	90                   	nop
f01004ad:	90                   	nop
f01004ae:	90                   	nop
f01004af:	90                   	nop
f01004b0:	90                   	nop
f01004b1:	90                   	nop
f01004b2:	90                   	nop
f01004b3:	90                   	nop
f01004b4:	90                   	nop
f01004b5:	90                   	nop
f01004b6:	90                   	nop
f01004b7:	90                   	nop
f01004b8:	90                   	nop
f01004b9:	90                   	nop
f01004ba:	90                   	nop
f01004bb:	90                   	nop
f01004bc:	90                   	nop
f01004bd:	90                   	nop
f01004be:	90                   	nop
f01004bf:	90                   	nop
f01004c0:	90                   	nop
f01004c1:	90                   	nop
f01004c2:	90                   	nop
f01004c3:	90                   	nop
f01004c4:	90                   	nop
f01004c5:	90                   	nop
f01004c6:	90                   	nop
f01004c7:	90                   	nop
f01004c8:	90                   	nop
f01004c9:	90                   	nop
f01004ca:	90                   	nop
f01004cb:	90                   	nop
f01004cc:	90                   	nop
f01004cd:	90                   	nop
f01004ce:	90                   	nop
f01004cf:	90                   	nop
f01004d0:	90                   	nop
f01004d1:	90                   	nop
f01004d2:	90                   	nop
f01004d3:	90                   	nop
f01004d4:	90                   	nop
f01004d5:	90                   	nop
f01004d6:	90                   	nop
f01004d7:	90                   	nop
f01004d8:	90                   	nop
f01004d9:	90                   	nop
f01004da:	90                   	nop
f01004db:	90                   	nop
f01004dc:	90                   	nop
f01004dd:	90                   	nop
f01004de:	90                   	nop
f01004df:	90                   	nop
f01004e0:	90                   	nop
f01004e1:	90                   	nop
f01004e2:	90                   	nop
f01004e3:	90                   	nop
f01004e4:	90                   	nop
f01004e5:	90                   	nop
f01004e6:	90                   	nop
f01004e7:	90                   	nop
f01004e8:	90                   	nop
f01004e9:	90                   	nop
f01004ea:	90                   	nop
f01004eb:	90                   	nop
f01004ec:	90                   	nop
f01004ed:	90                   	nop
f01004ee:	90                   	nop
f01004ef:	90                   	nop
f01004f0:	90                   	nop
f01004f1:	90                   	nop
f01004f2:	90                   	nop
f01004f3:	90                   	nop
f01004f4:	90                   	nop
f01004f5:	90                   	nop
f01004f6:	90                   	nop
f01004f7:	90                   	nop
f01004f8:	90                   	nop
f01004f9:	90                   	nop
f01004fa:	90                   	nop
f01004fb:	90                   	nop
f01004fc:	90                   	nop
f01004fd:	90                   	nop
f01004fe:	90                   	nop
f01004ff:	90                   	nop
f0100500:	90                   	nop
f0100501:	90                   	nop
f0100502:	90                   	nop
f0100503:	90                   	nop
f0100504:	90                   	nop
f0100505:	90                   	nop
f0100506:	90                   	nop
f0100507:	90                   	nop
f0100508:	90                   	nop
f0100509:	90                   	nop
f010050a:	90                   	nop
f010050b:	90                   	nop
f010050c:	90                   	nop
f010050d:	90                   	nop
f010050e:	90                   	nop
f010050f:	90                   	nop
f0100510:	90                   	nop
f0100511:	90                   	nop
f0100512:	90                   	nop
f0100513:	90                   	nop
f0100514:	90                   	nop
f0100515:	90                   	nop
f0100516:	90                   	nop
f0100517:	90                   	nop
f0100518:	90                   	nop
f0100519:	90                   	nop
f010051a:	90                   	nop
f010051b:	90                   	nop
f010051c:	90                   	nop
f010051d:	90                   	nop
f010051e:	90                   	nop
f010051f:	90                   	nop
f0100520:	90                   	nop
f0100521:	90                   	nop
f0100522:	90                   	nop
f0100523:	90                   	nop
f0100524:	90                   	nop
f0100525:	90                   	nop
f0100526:	90                   	nop
f0100527:	90                   	nop
f0100528:	90                   	nop
f0100529:	90                   	nop
f010052a:	90                   	nop
f010052b:	90                   	nop
f010052c:	90                   	nop
f010052d:	90                   	nop
f010052e:	90                   	nop
f010052f:	90                   	nop
f0100530:	90                   	nop
f0100531:	90                   	nop
f0100532:	90                   	nop
f0100533:	90                   	nop
f0100534:	90                   	nop
f0100535:	90                   	nop
f0100536:	90                   	nop
f0100537:	90                   	nop
f0100538:	90                   	nop
f0100539:	90                   	nop
f010053a:	90                   	nop
f010053b:	90                   	nop
f010053c:	90                   	nop
f010053d:	90                   	nop
f010053e:	90                   	nop
f010053f:	90                   	nop
f0100540:	90                   	nop
f0100541:	90                   	nop
f0100542:	90                   	nop
f0100543:	90                   	nop
f0100544:	90                   	nop
f0100545:	90                   	nop
f0100546:	90                   	nop
f0100547:	90                   	nop
f0100548:	90                   	nop
f0100549:	90                   	nop
f010054a:	90                   	nop
f010054b:	90                   	nop
f010054c:	90                   	nop
f010054d:	90                   	nop
f010054e:	90                   	nop
f010054f:	90                   	nop
f0100550:	90                   	nop
f0100551:	90                   	nop
f0100552:	90                   	nop
f0100553:	90                   	nop
f0100554:	90                   	nop
f0100555:	90                   	nop
f0100556:	90                   	nop
f0100557:	90                   	nop
f0100558:	90                   	nop
f0100559:	90                   	nop
f010055a:	90                   	nop
f010055b:	90                   	nop
f010055c:	90                   	nop
f010055d:	90                   	nop
f010055e:	90                   	nop
f010055f:	90                   	nop
f0100560:	90                   	nop
f0100561:	90                   	nop
f0100562:	90                   	nop
f0100563:	90                   	nop
f0100564:	90                   	nop
f0100565:	90                   	nop
f0100566:	90                   	nop
f0100567:	90                   	nop
f0100568:	90                   	nop
f0100569:	90                   	nop
f010056a:	90                   	nop
f010056b:	90                   	nop
f010056c:	90                   	nop
f010056d:	90                   	nop
f010056e:	90                   	nop
f010056f:	90                   	nop
f0100570:	90                   	nop
f0100571:	90                   	nop
f0100572:	90                   	nop
f0100573:	90                   	nop
f0100574:	90                   	nop
f0100575:	90                   	nop
f0100576:	90                   	nop
f0100577:	90                   	nop
f0100578:	90                   	nop
f0100579:	90                   	nop
f010057a:	90                   	nop
f010057b:	90                   	nop
f010057c:	90                   	nop
f010057d:	90                   	nop
f010057e:	90                   	nop
f010057f:	90                   	nop
f0100580:	90                   	nop
f0100581:	90                   	nop
f0100582:	90                   	nop
f0100583:	90                   	nop
f0100584:	90                   	nop
f0100585:	90                   	nop
f0100586:	90                   	nop
f0100587:	90                   	nop
f0100588:	90                   	nop
f0100589:	90                   	nop
f010058a:	90                   	nop
f010058b:	90                   	nop
f010058c:	90                   	nop
f010058d:	90                   	nop
f010058e:	90                   	nop
f010058f:	90                   	nop
f0100590:	90                   	nop
f0100591:	90                   	nop
f0100592:	90                   	nop
f0100593:	90                   	nop
f0100594:	90                   	nop
f0100595:	90                   	nop
f0100596:	90                   	nop
f0100597:	90                   	nop
f0100598:	90                   	nop
f0100599:	90                   	nop
f010059a:	90                   	nop
f010059b:	90                   	nop
f010059c:	90                   	nop
f010059d:	90                   	nop
f010059e:	90                   	nop
f010059f:	90                   	nop
f01005a0:	90                   	nop
f01005a1:	90                   	nop
f01005a2:	90                   	nop
f01005a3:	90                   	nop
f01005a4:	90                   	nop
f01005a5:	90                   	nop
f01005a6:	90                   	nop
f01005a7:	90                   	nop
f01005a8:	90                   	nop
f01005a9:	90                   	nop
f01005aa:	90                   	nop
f01005ab:	90                   	nop
f01005ac:	90                   	nop
f01005ad:	90                   	nop
f01005ae:	90                   	nop
f01005af:	90                   	nop
f01005b0:	90                   	nop
f01005b1:	90                   	nop
f01005b2:	90                   	nop
f01005b3:	90                   	nop
f01005b4:	90                   	nop
f01005b5:	90                   	nop
f01005b6:	90                   	nop
f01005b7:	90                   	nop
f01005b8:	90                   	nop
f01005b9:	90                   	nop
f01005ba:	90                   	nop
f01005bb:	90                   	nop
f01005bc:	90                   	nop
f01005bd:	90                   	nop
f01005be:	90                   	nop
f01005bf:	90                   	nop
f01005c0:	90                   	nop
f01005c1:	90                   	nop
f01005c2:	90                   	nop
f01005c3:	90                   	nop
f01005c4:	90                   	nop
f01005c5:	90                   	nop
f01005c6:	90                   	nop
f01005c7:	90                   	nop
f01005c8:	90                   	nop
f01005c9:	90                   	nop
f01005ca:	90                   	nop
f01005cb:	90                   	nop
f01005cc:	90                   	nop
f01005cd:	90                   	nop
f01005ce:	90                   	nop
f01005cf:	90                   	nop
f01005d0:	90                   	nop
f01005d1:	90                   	nop
f01005d2:	90                   	nop
f01005d3:	90                   	nop
f01005d4:	90                   	nop
f01005d5:	90                   	nop
f01005d6:	90                   	nop
f01005d7:	90                   	nop
f01005d8:	90                   	nop
f01005d9:	90                   	nop
f01005da:	90                   	nop
f01005db:	90                   	nop
f01005dc:	90                   	nop
f01005dd:	90                   	nop
f01005de:	90                   	nop
f01005df:	90                   	nop
f01005e0:	90                   	nop
f01005e1:	90                   	nop
f01005e2:	90                   	nop
f01005e3:	90                   	nop
f01005e4:	90                   	nop
f01005e5:	90                   	nop
f01005e6:	90                   	nop
f01005e7:	90                   	nop
f01005e8:	90                   	nop
f01005e9:	90                   	nop
f01005ea:	90                   	nop
f01005eb:	90                   	nop
f01005ec:	90                   	nop
f01005ed:	90                   	nop
f01005ee:	90                   	nop
f01005ef:	90                   	nop
f01005f0:	90                   	nop
f01005f1:	90                   	nop
f01005f2:	90                   	nop
f01005f3:	90                   	nop
f01005f4:	90                   	nop
f01005f5:	90                   	nop
f01005f6:	90                   	nop
f01005f7:	90                   	nop
f01005f8:	90                   	nop
f01005f9:	90                   	nop
f01005fa:	90                   	nop
f01005fb:	90                   	nop
f01005fc:	90                   	nop
f01005fd:	90                   	nop
f01005fe:	90                   	nop
f01005ff:	90                   	nop
f0100600:	90                   	nop
f0100601:	90                   	nop
f0100602:	90                   	nop
f0100603:	90                   	nop
f0100604:	90                   	nop
f0100605:	90                   	nop
f0100606:	90                   	nop
f0100607:	90                   	nop
f0100608:	90                   	nop
f0100609:	90                   	nop
f010060a:	90                   	nop
f010060b:	90                   	nop
f010060c:	90                   	nop
f010060d:	90                   	nop
f010060e:	90                   	nop
f010060f:	90                   	nop
f0100610:	90                   	nop
f0100611:	90                   	nop
f0100612:	90                   	nop
f0100613:	90                   	nop
f0100614:	90                   	nop
f0100615:	90                   	nop
f0100616:	90                   	nop
f0100617:	90                   	nop
f0100618:	90                   	nop
f0100619:	90                   	nop
f010061a:	90                   	nop
f010061b:	90                   	nop
f010061c:	90                   	nop
f010061d:	90                   	nop
f010061e:	90                   	nop
f010061f:	90                   	nop
f0100620:	90                   	nop
f0100621:	90                   	nop
f0100622:	90                   	nop
f0100623:	90                   	nop
f0100624:	90                   	nop
f0100625:	90                   	nop
f0100626:	90                   	nop
f0100627:	90                   	nop
f0100628:	90                   	nop
f0100629:	90                   	nop
f010062a:	90                   	nop
f010062b:	90                   	nop
f010062c:	90                   	nop
f010062d:	90                   	nop
f010062e:	90                   	nop
f010062f:	90                   	nop
f0100630:	90                   	nop
f0100631:	90                   	nop
f0100632:	90                   	nop
f0100633:	90                   	nop
f0100634:	90                   	nop
f0100635:	90                   	nop
f0100636:	90                   	nop
f0100637:	90                   	nop
f0100638:	90                   	nop
f0100639:	90                   	nop
f010063a:	90                   	nop
f010063b:	90                   	nop
f010063c:	90                   	nop
f010063d:	90                   	nop
f010063e:	90                   	nop
f010063f:	90                   	nop
f0100640:	90                   	nop
f0100641:	90                   	nop
f0100642:	90                   	nop
f0100643:	90                   	nop
f0100644:	90                   	nop
f0100645:	90                   	nop
f0100646:	90                   	nop
f0100647:	90                   	nop
f0100648:	90                   	nop
f0100649:	90                   	nop
f010064a:	90                   	nop
f010064b:	90                   	nop
f010064c:	90                   	nop
f010064d:	90                   	nop
f010064e:	90                   	nop
f010064f:	90                   	nop
f0100650:	90                   	nop
f0100651:	90                   	nop
f0100652:	90                   	nop
f0100653:	90                   	nop
f0100654:	90                   	nop
f0100655:	90                   	nop
f0100656:	90                   	nop
f0100657:	90                   	nop
f0100658:	90                   	nop
f0100659:	90                   	nop
f010065a:	90                   	nop
f010065b:	90                   	nop
f010065c:	90                   	nop
f010065d:	90                   	nop
f010065e:	90                   	nop
f010065f:	90                   	nop
f0100660:	90                   	nop
f0100661:	90                   	nop
f0100662:	90                   	nop
f0100663:	90                   	nop
f0100664:	90                   	nop
f0100665:	90                   	nop
f0100666:	90                   	nop
f0100667:	90                   	nop
f0100668:	90                   	nop
f0100669:	90                   	nop
f010066a:	90                   	nop
f010066b:	90                   	nop
f010066c:	90                   	nop
f010066d:	90                   	nop
f010066e:	90                   	nop
f010066f:	90                   	nop
f0100670:	90                   	nop
f0100671:	90                   	nop
f0100672:	90                   	nop
f0100673:	90                   	nop
f0100674:	90                   	nop
f0100675:	90                   	nop
f0100676:	90                   	nop
f0100677:	90                   	nop
f0100678:	90                   	nop
f0100679:	90                   	nop
f010067a:	90                   	nop
f010067b:	90                   	nop
f010067c:	90                   	nop
f010067d:	90                   	nop
f010067e:	90                   	nop
f010067f:	90                   	nop
f0100680:	90                   	nop
f0100681:	90                   	nop
f0100682:	90                   	nop
f0100683:	90                   	nop
f0100684:	90                   	nop
f0100685:	90                   	nop
f0100686:	90                   	nop
f0100687:	90                   	nop
f0100688:	90                   	nop
f0100689:	90                   	nop
f010068a:	90                   	nop
f010068b:	90                   	nop
f010068c:	90                   	nop
f010068d:	90                   	nop
f010068e:	90                   	nop
f010068f:	90                   	nop
f0100690:	90                   	nop
f0100691:	90                   	nop
f0100692:	90                   	nop
f0100693:	90                   	nop
f0100694:	90                   	nop
f0100695:	90                   	nop
f0100696:	90                   	nop
f0100697:	90                   	nop
f0100698:	90                   	nop
f0100699:	90                   	nop
f010069a:	90                   	nop
f010069b:	90                   	nop
f010069c:	90                   	nop
f010069d:	90                   	nop
f010069e:	90                   	nop
f010069f:	90                   	nop
f01006a0:	90                   	nop
f01006a1:	90                   	nop
f01006a2:	90                   	nop
f01006a3:	90                   	nop
f01006a4:	90                   	nop
f01006a5:	90                   	nop
f01006a6:	90                   	nop
f01006a7:	90                   	nop
f01006a8:	90                   	nop
f01006a9:	90                   	nop
f01006aa:	90                   	nop
f01006ab:	90                   	nop
f01006ac:	90                   	nop
f01006ad:	90                   	nop
f01006ae:	90                   	nop
f01006af:	90                   	nop
f01006b0:	90                   	nop
f01006b1:	90                   	nop
f01006b2:	90                   	nop
f01006b3:	90                   	nop
f01006b4:	90                   	nop
f01006b5:	90                   	nop
f01006b6:	90                   	nop
f01006b7:	90                   	nop
f01006b8:	90                   	nop
f01006b9:	90                   	nop
f01006ba:	90                   	nop
f01006bb:	90                   	nop
f01006bc:	90                   	nop
f01006bd:	90                   	nop
f01006be:	90                   	nop
f01006bf:	90                   	nop
f01006c0:	90                   	nop
f01006c1:	90                   	nop
f01006c2:	90                   	nop
f01006c3:	90                   	nop
f01006c4:	90                   	nop
f01006c5:	90                   	nop
f01006c6:	90                   	nop
f01006c7:	90                   	nop
f01006c8:	90                   	nop
f01006c9:	90                   	nop
f01006ca:	90                   	nop
f01006cb:	90                   	nop
f01006cc:	90                   	nop
f01006cd:	90                   	nop
f01006ce:	90                   	nop
f01006cf:	90                   	nop
f01006d0:	90                   	nop
f01006d1:	90                   	nop
f01006d2:	90                   	nop
f01006d3:	90                   	nop
f01006d4:	90                   	nop
f01006d5:	90                   	nop
f01006d6:	90                   	nop
f01006d7:	90                   	nop
f01006d8:	90                   	nop
f01006d9:	90                   	nop
f01006da:	90                   	nop
f01006db:	90                   	nop
f01006dc:	90                   	nop
f01006dd:	90                   	nop
f01006de:	90                   	nop
f01006df:	90                   	nop
f01006e0:	90                   	nop
f01006e1:	90                   	nop
f01006e2:	90                   	nop
f01006e3:	90                   	nop
f01006e4:	90                   	nop
f01006e5:	90                   	nop
f01006e6:	90                   	nop
f01006e7:	90                   	nop
f01006e8:	90                   	nop
f01006e9:	90                   	nop
f01006ea:	90                   	nop
f01006eb:	90                   	nop
f01006ec:	90                   	nop
f01006ed:	90                   	nop
f01006ee:	90                   	nop
f01006ef:	90                   	nop
f01006f0:	90                   	nop
f01006f1:	90                   	nop
f01006f2:	90                   	nop
f01006f3:	90                   	nop
f01006f4:	90                   	nop
f01006f5:	90                   	nop
f01006f6:	90                   	nop
f01006f7:	90                   	nop
f01006f8:	90                   	nop
f01006f9:	90                   	nop
f01006fa:	90                   	nop
f01006fb:	90                   	nop
f01006fc:	90                   	nop
f01006fd:	90                   	nop
f01006fe:	90                   	nop
f01006ff:	90                   	nop
f0100700:	90                   	nop
f0100701:	90                   	nop
f0100702:	90                   	nop
f0100703:	90                   	nop
f0100704:	90                   	nop
f0100705:	90                   	nop
f0100706:	90                   	nop
f0100707:	90                   	nop
f0100708:	90                   	nop
f0100709:	90                   	nop
f010070a:	90                   	nop
f010070b:	90                   	nop
f010070c:	90                   	nop
f010070d:	90                   	nop
f010070e:	90                   	nop
f010070f:	90                   	nop
f0100710:	90                   	nop
f0100711:	90                   	nop
f0100712:	90                   	nop
f0100713:	90                   	nop
f0100714:	90                   	nop
f0100715:	90                   	nop
f0100716:	90                   	nop
f0100717:	90                   	nop
f0100718:	90                   	nop
f0100719:	90                   	nop
f010071a:	90                   	nop
f010071b:	90                   	nop
f010071c:	90                   	nop
f010071d:	90                   	nop
f010071e:	90                   	nop
f010071f:	90                   	nop
f0100720:	90                   	nop
f0100721:	90                   	nop
f0100722:	90                   	nop
f0100723:	90                   	nop
f0100724:	90                   	nop
f0100725:	90                   	nop
f0100726:	90                   	nop
f0100727:	90                   	nop
f0100728:	90                   	nop
f0100729:	90                   	nop
f010072a:	90                   	nop
f010072b:	90                   	nop
f010072c:	90                   	nop
f010072d:	90                   	nop
f010072e:	90                   	nop
f010072f:	90                   	nop
f0100730:	90                   	nop
f0100731:	90                   	nop
f0100732:	90                   	nop
f0100733:	90                   	nop
f0100734:	90                   	nop
f0100735:	90                   	nop
f0100736:	90                   	nop
f0100737:	90                   	nop
f0100738:	90                   	nop
f0100739:	90                   	nop
f010073a:	90                   	nop
f010073b:	90                   	nop
f010073c:	90                   	nop
f010073d:	90                   	nop
f010073e:	90                   	nop
f010073f:	90                   	nop
f0100740:	90                   	nop
f0100741:	90                   	nop
f0100742:	90                   	nop
f0100743:	90                   	nop
f0100744:	90                   	nop
f0100745:	90                   	nop
f0100746:	90                   	nop
f0100747:	90                   	nop
f0100748:	90                   	nop
f0100749:	90                   	nop
f010074a:	90                   	nop
f010074b:	90                   	nop
f010074c:	90                   	nop
f010074d:	90                   	nop
f010074e:	90                   	nop
f010074f:	90                   	nop
f0100750:	90                   	nop
f0100751:	90                   	nop
f0100752:	90                   	nop
f0100753:	90                   	nop
f0100754:	90                   	nop
f0100755:	90                   	nop
f0100756:	90                   	nop
f0100757:	90                   	nop
f0100758:	90                   	nop
f0100759:	90                   	nop
f010075a:	90                   	nop
f010075b:	90                   	nop
f010075c:	90                   	nop
f010075d:	90                   	nop
f010075e:	90                   	nop
f010075f:	90                   	nop
f0100760:	90                   	nop
f0100761:	90                   	nop
f0100762:	90                   	nop
f0100763:	90                   	nop
f0100764:	90                   	nop
f0100765:	90                   	nop
f0100766:	90                   	nop
f0100767:	90                   	nop
f0100768:	90                   	nop
f0100769:	90                   	nop
f010076a:	90                   	nop
f010076b:	90                   	nop
f010076c:	90                   	nop
f010076d:	90                   	nop
f010076e:	90                   	nop
f010076f:	90                   	nop
f0100770:	90                   	nop
f0100771:	90                   	nop
f0100772:	90                   	nop
f0100773:	90                   	nop
f0100774:	90                   	nop
f0100775:	90                   	nop
f0100776:	90                   	nop
f0100777:	90                   	nop
f0100778:	90                   	nop
f0100779:	90                   	nop
f010077a:	90                   	nop
f010077b:	90                   	nop
f010077c:	90                   	nop
f010077d:	90                   	nop
f010077e:	90                   	nop
f010077f:	90                   	nop
f0100780:	90                   	nop
f0100781:	90                   	nop
f0100782:	90                   	nop
f0100783:	90                   	nop
f0100784:	90                   	nop
f0100785:	90                   	nop
f0100786:	90                   	nop
f0100787:	90                   	nop
f0100788:	90                   	nop
f0100789:	90                   	nop
f010078a:	90                   	nop
f010078b:	90                   	nop
f010078c:	90                   	nop
f010078d:	90                   	nop
f010078e:	90                   	nop
f010078f:	90                   	nop
f0100790:	90                   	nop
f0100791:	90                   	nop
f0100792:	90                   	nop
f0100793:	90                   	nop
f0100794:	90                   	nop
f0100795:	90                   	nop
f0100796:	90                   	nop
f0100797:	90                   	nop
f0100798:	90                   	nop
f0100799:	90                   	nop
f010079a:	90                   	nop
f010079b:	90                   	nop
f010079c:	90                   	nop
f010079d:	90                   	nop
f010079e:	90                   	nop
f010079f:	90                   	nop
f01007a0:	90                   	nop
f01007a1:	90                   	nop
f01007a2:	90                   	nop
f01007a3:	90                   	nop
f01007a4:	90                   	nop
f01007a5:	90                   	nop
f01007a6:	90                   	nop
f01007a7:	90                   	nop
f01007a8:	90                   	nop
f01007a9:	90                   	nop
f01007aa:	90                   	nop
f01007ab:	90                   	nop
f01007ac:	90                   	nop
f01007ad:	90                   	nop
f01007ae:	90                   	nop
f01007af:	90                   	nop
f01007b0:	90                   	nop
f01007b1:	90                   	nop
f01007b2:	90                   	nop
f01007b3:	90                   	nop
f01007b4:	90                   	nop
f01007b5:	90                   	nop
f01007b6:	90                   	nop
f01007b7:	90                   	nop
f01007b8:	90                   	nop
f01007b9:	90                   	nop
f01007ba:	90                   	nop
f01007bb:	90                   	nop
f01007bc:	90                   	nop
f01007bd:	90                   	nop
f01007be:	90                   	nop
f01007bf:	90                   	nop
f01007c0:	90                   	nop
f01007c1:	90                   	nop
f01007c2:	90                   	nop
f01007c3:	90                   	nop
f01007c4:	90                   	nop
f01007c5:	90                   	nop
f01007c6:	90                   	nop
f01007c7:	90                   	nop
f01007c8:	90                   	nop
f01007c9:	90                   	nop
f01007ca:	90                   	nop
f01007cb:	90                   	nop
f01007cc:	90                   	nop
f01007cd:	90                   	nop
f01007ce:	90                   	nop
f01007cf:	90                   	nop
f01007d0:	90                   	nop
f01007d1:	90                   	nop
f01007d2:	90                   	nop
f01007d3:	90                   	nop
f01007d4:	90                   	nop
f01007d5:	90                   	nop
f01007d6:	90                   	nop
f01007d7:	90                   	nop
f01007d8:	90                   	nop
f01007d9:	90                   	nop
f01007da:	90                   	nop
f01007db:	90                   	nop
f01007dc:	90                   	nop
f01007dd:	90                   	nop
f01007de:	90                   	nop
f01007df:	90                   	nop
f01007e0:	90                   	nop
f01007e1:	90                   	nop
f01007e2:	90                   	nop
f01007e3:	90                   	nop
f01007e4:	90                   	nop
f01007e5:	90                   	nop
f01007e6:	90                   	nop
f01007e7:	90                   	nop
f01007e8:	90                   	nop
f01007e9:	90                   	nop
f01007ea:	90                   	nop
f01007eb:	90                   	nop
f01007ec:	90                   	nop
f01007ed:	90                   	nop
f01007ee:	90                   	nop
f01007ef:	90                   	nop
f01007f0:	90                   	nop
f01007f1:	90                   	nop
f01007f2:	90                   	nop
f01007f3:	90                   	nop
f01007f4:	90                   	nop
f01007f5:	90                   	nop
f01007f6:	90                   	nop
f01007f7:	90                   	nop
f01007f8:	90                   	nop
f01007f9:	90                   	nop
f01007fa:	90                   	nop
f01007fb:	90                   	nop
f01007fc:	90                   	nop
f01007fd:	90                   	nop
f01007fe:	90                   	nop
f01007ff:	90                   	nop
f0100800:	90                   	nop
f0100801:	90                   	nop
f0100802:	90                   	nop
f0100803:	90                   	nop
f0100804:	90                   	nop
f0100805:	90                   	nop
f0100806:	90                   	nop
f0100807:	90                   	nop
f0100808:	90                   	nop
f0100809:	90                   	nop
f010080a:	90                   	nop
f010080b:	90                   	nop
f010080c:	90                   	nop
f010080d:	90                   	nop
f010080e:	90                   	nop
f010080f:	90                   	nop
f0100810:	90                   	nop
f0100811:	90                   	nop
f0100812:	90                   	nop
f0100813:	90                   	nop
f0100814:	90                   	nop
f0100815:	90                   	nop
f0100816:	90                   	nop
f0100817:	90                   	nop
f0100818:	90                   	nop
f0100819:	90                   	nop
f010081a:	90                   	nop
f010081b:	90                   	nop
f010081c:	90                   	nop
f010081d:	90                   	nop
f010081e:	90                   	nop
f010081f:	90                   	nop
f0100820:	90                   	nop
f0100821:	90                   	nop
f0100822:	90                   	nop
f0100823:	90                   	nop
f0100824:	90                   	nop
f0100825:	90                   	nop
f0100826:	90                   	nop
f0100827:	90                   	nop
f0100828:	90                   	nop
f0100829:	90                   	nop
f010082a:	90                   	nop
f010082b:	90                   	nop
f010082c:	90                   	nop
f010082d:	90                   	nop
f010082e:	90                   	nop
f010082f:	90                   	nop
f0100830:	90                   	nop
f0100831:	90                   	nop
f0100832:	90                   	nop
f0100833:	90                   	nop
f0100834:	90                   	nop
f0100835:	90                   	nop
f0100836:	90                   	nop
f0100837:	90                   	nop
f0100838:	90                   	nop
f0100839:	90                   	nop
f010083a:	90                   	nop
f010083b:	90                   	nop
f010083c:	90                   	nop
f010083d:	90                   	nop
f010083e:	90                   	nop
f010083f:	90                   	nop
f0100840:	90                   	nop
f0100841:	90                   	nop
f0100842:	90                   	nop
f0100843:	90                   	nop
f0100844:	90                   	nop
f0100845:	90                   	nop
f0100846:	90                   	nop
f0100847:	90                   	nop
f0100848:	90                   	nop
f0100849:	90                   	nop
f010084a:	90                   	nop
f010084b:	90                   	nop
f010084c:	90                   	nop
f010084d:	90                   	nop
f010084e:	90                   	nop
f010084f:	90                   	nop
f0100850:	90                   	nop
f0100851:	90                   	nop
f0100852:	90                   	nop
f0100853:	90                   	nop
f0100854:	90                   	nop
f0100855:	90                   	nop
f0100856:	90                   	nop
f0100857:	90                   	nop
f0100858:	90                   	nop
f0100859:	90                   	nop
f010085a:	90                   	nop
f010085b:	90                   	nop
f010085c:	90                   	nop
f010085d:	90                   	nop
f010085e:	90                   	nop
f010085f:	90                   	nop
f0100860:	90                   	nop
f0100861:	90                   	nop
f0100862:	90                   	nop
f0100863:	90                   	nop
f0100864:	90                   	nop
f0100865:	90                   	nop
f0100866:	90                   	nop
f0100867:	90                   	nop
f0100868:	90                   	nop
f0100869:	90                   	nop
f010086a:	90                   	nop
f010086b:	90                   	nop
f010086c:	90                   	nop
f010086d:	90                   	nop
f010086e:	90                   	nop
f010086f:	90                   	nop
f0100870:	90                   	nop
f0100871:	90                   	nop
f0100872:	90                   	nop
f0100873:	90                   	nop
f0100874:	90                   	nop
f0100875:	90                   	nop
f0100876:	90                   	nop
f0100877:	90                   	nop
f0100878:	90                   	nop
f0100879:	90                   	nop
f010087a:	90                   	nop
f010087b:	90                   	nop
f010087c:	90                   	nop
f010087d:	90                   	nop
f010087e:	90                   	nop
f010087f:	90                   	nop
f0100880:	90                   	nop
f0100881:	90                   	nop
f0100882:	90                   	nop
f0100883:	90                   	nop
f0100884:	90                   	nop
f0100885:	90                   	nop
f0100886:	90                   	nop
f0100887:	90                   	nop
f0100888:	90                   	nop
f0100889:	90                   	nop
f010088a:	90                   	nop
f010088b:	90                   	nop
f010088c:	90                   	nop
f010088d:	90                   	nop
f010088e:	90                   	nop
f010088f:	90                   	nop
f0100890:	90                   	nop
f0100891:	90                   	nop
f0100892:	90                   	nop
f0100893:	90                   	nop
f0100894:	90                   	nop
f0100895:	90                   	nop
f0100896:	90                   	nop
f0100897:	90                   	nop
f0100898:	90                   	nop
f0100899:	90                   	nop
f010089a:	90                   	nop
f010089b:	90                   	nop
f010089c:	90                   	nop
f010089d:	90                   	nop
f010089e:	90                   	nop
f010089f:	90                   	nop
f01008a0:	90                   	nop
f01008a1:	90                   	nop
f01008a2:	90                   	nop
f01008a3:	90                   	nop
f01008a4:	90                   	nop
f01008a5:	90                   	nop
f01008a6:	90                   	nop
f01008a7:	90                   	nop
f01008a8:	90                   	nop
f01008a9:	90                   	nop
f01008aa:	90                   	nop
f01008ab:	90                   	nop
f01008ac:	90                   	nop
f01008ad:	90                   	nop
f01008ae:	90                   	nop
f01008af:	90                   	nop
f01008b0:	90                   	nop
f01008b1:	90                   	nop
f01008b2:	90                   	nop
f01008b3:	90                   	nop
f01008b4:	90                   	nop
f01008b5:	90                   	nop
f01008b6:	90                   	nop
f01008b7:	90                   	nop
f01008b8:	90                   	nop
f01008b9:	90                   	nop
f01008ba:	90                   	nop
f01008bb:	90                   	nop
f01008bc:	90                   	nop
f01008bd:	90                   	nop
f01008be:	90                   	nop
f01008bf:	90                   	nop
f01008c0:	90                   	nop
f01008c1:	90                   	nop
f01008c2:	90                   	nop
f01008c3:	90                   	nop
f01008c4:	90                   	nop
f01008c5:	90                   	nop
f01008c6:	90                   	nop
f01008c7:	90                   	nop
f01008c8:	90                   	nop
f01008c9:	90                   	nop
f01008ca:	90                   	nop
f01008cb:	90                   	nop
f01008cc:	90                   	nop
f01008cd:	90                   	nop
f01008ce:	90                   	nop
f01008cf:	90                   	nop
f01008d0:	90                   	nop
f01008d1:	90                   	nop
f01008d2:	90                   	nop
f01008d3:	90                   	nop
f01008d4:	90                   	nop
f01008d5:	90                   	nop
f01008d6:	90                   	nop
f01008d7:	90                   	nop
f01008d8:	90                   	nop
f01008d9:	90                   	nop
f01008da:	90                   	nop
f01008db:	90                   	nop
f01008dc:	90                   	nop
f01008dd:	90                   	nop
f01008de:	90                   	nop
f01008df:	90                   	nop
f01008e0:	90                   	nop
f01008e1:	90                   	nop
f01008e2:	90                   	nop
f01008e3:	90                   	nop
f01008e4:	90                   	nop
f01008e5:	90                   	nop
f01008e6:	90                   	nop
f01008e7:	90                   	nop
f01008e8:	90                   	nop
f01008e9:	90                   	nop
f01008ea:	90                   	nop
f01008eb:	90                   	nop
f01008ec:	90                   	nop
f01008ed:	90                   	nop
f01008ee:	90                   	nop
f01008ef:	90                   	nop
f01008f0:	90                   	nop
f01008f1:	90                   	nop
f01008f2:	90                   	nop
f01008f3:	90                   	nop
f01008f4:	90                   	nop
f01008f5:	90                   	nop
f01008f6:	90                   	nop
f01008f7:	90                   	nop
f01008f8:	90                   	nop
f01008f9:	90                   	nop
f01008fa:	90                   	nop
f01008fb:	90                   	nop
f01008fc:	90                   	nop
f01008fd:	90                   	nop
f01008fe:	90                   	nop
f01008ff:	90                   	nop
f0100900:	90                   	nop
f0100901:	90                   	nop
f0100902:	90                   	nop
f0100903:	90                   	nop
f0100904:	90                   	nop
f0100905:	90                   	nop
f0100906:	90                   	nop
f0100907:	90                   	nop
f0100908:	90                   	nop
f0100909:	90                   	nop
f010090a:	90                   	nop
f010090b:	90                   	nop
f010090c:	90                   	nop
f010090d:	90                   	nop
f010090e:	90                   	nop
f010090f:	90                   	nop
f0100910:	90                   	nop
f0100911:	90                   	nop
f0100912:	90                   	nop
f0100913:	90                   	nop
f0100914:	90                   	nop
f0100915:	90                   	nop
f0100916:	90                   	nop
f0100917:	90                   	nop
f0100918:	90                   	nop
f0100919:	90                   	nop
f010091a:	90                   	nop
f010091b:	90                   	nop
f010091c:	90                   	nop
f010091d:	90                   	nop
f010091e:	90                   	nop
f010091f:	90                   	nop
f0100920:	90                   	nop
f0100921:	90                   	nop
f0100922:	90                   	nop
f0100923:	90                   	nop
f0100924:	90                   	nop
f0100925:	90                   	nop
f0100926:	90                   	nop
f0100927:	90                   	nop
f0100928:	90                   	nop
f0100929:	90                   	nop
f010092a:	90                   	nop
f010092b:	90                   	nop
f010092c:	90                   	nop
f010092d:	90                   	nop
f010092e:	90                   	nop
f010092f:	90                   	nop
f0100930:	90                   	nop
f0100931:	90                   	nop
f0100932:	90                   	nop
f0100933:	90                   	nop
f0100934:	90                   	nop
f0100935:	90                   	nop
f0100936:	90                   	nop
f0100937:	90                   	nop
f0100938:	90                   	nop
f0100939:	90                   	nop
f010093a:	90                   	nop
f010093b:	90                   	nop
f010093c:	90                   	nop
f010093d:	90                   	nop
f010093e:	90                   	nop
f010093f:	90                   	nop
f0100940:	90                   	nop
f0100941:	90                   	nop
f0100942:	90                   	nop
f0100943:	90                   	nop
f0100944:	90                   	nop
f0100945:	90                   	nop
f0100946:	90                   	nop
f0100947:	90                   	nop
f0100948:	90                   	nop
f0100949:	90                   	nop
f010094a:	90                   	nop
f010094b:	90                   	nop
f010094c:	90                   	nop
f010094d:	90                   	nop
f010094e:	90                   	nop
f010094f:	90                   	nop
f0100950:	90                   	nop
f0100951:	90                   	nop
f0100952:	90                   	nop
f0100953:	90                   	nop
f0100954:	90                   	nop
f0100955:	90                   	nop
f0100956:	90                   	nop
f0100957:	90                   	nop
f0100958:	90                   	nop
f0100959:	90                   	nop
f010095a:	90                   	nop
f010095b:	90                   	nop
f010095c:	90                   	nop
f010095d:	90                   	nop
f010095e:	90                   	nop
f010095f:	90                   	nop
f0100960:	90                   	nop
f0100961:	90                   	nop
f0100962:	90                   	nop
f0100963:	90                   	nop
f0100964:	90                   	nop
f0100965:	90                   	nop
f0100966:	90                   	nop
f0100967:	90                   	nop
f0100968:	90                   	nop
f0100969:	90                   	nop
f010096a:	90                   	nop
f010096b:	90                   	nop
f010096c:	90                   	nop
f010096d:	90                   	nop
f010096e:	90                   	nop
f010096f:	90                   	nop
f0100970:	90                   	nop
f0100971:	90                   	nop
f0100972:	90                   	nop
f0100973:	90                   	nop
f0100974:	90                   	nop
f0100975:	90                   	nop
f0100976:	90                   	nop
f0100977:	90                   	nop
f0100978:	90                   	nop
f0100979:	90                   	nop
f010097a:	90                   	nop
f010097b:	90                   	nop
f010097c:	90                   	nop
f010097d:	90                   	nop
f010097e:	90                   	nop
f010097f:	90                   	nop
f0100980:	90                   	nop
f0100981:	90                   	nop
f0100982:	90                   	nop
f0100983:	90                   	nop
f0100984:	90                   	nop
f0100985:	90                   	nop
f0100986:	90                   	nop
f0100987:	90                   	nop
f0100988:	90                   	nop
f0100989:	90                   	nop
f010098a:	90                   	nop
f010098b:	90                   	nop
f010098c:	90                   	nop
f010098d:	90                   	nop
f010098e:	90                   	nop
f010098f:	90                   	nop
f0100990:	90                   	nop
f0100991:	90                   	nop
f0100992:	90                   	nop
f0100993:	90                   	nop
f0100994:	90                   	nop
f0100995:	90                   	nop
f0100996:	90                   	nop
f0100997:	90                   	nop
f0100998:	90                   	nop
f0100999:	90                   	nop
f010099a:	90                   	nop
f010099b:	90                   	nop
f010099c:	90                   	nop
f010099d:	90                   	nop
f010099e:	90                   	nop
f010099f:	90                   	nop
f01009a0:	90                   	nop
f01009a1:	90                   	nop
f01009a2:	90                   	nop
f01009a3:	90                   	nop
f01009a4:	90                   	nop
f01009a5:	90                   	nop
f01009a6:	90                   	nop
f01009a7:	90                   	nop
f01009a8:	90                   	nop
f01009a9:	90                   	nop
f01009aa:	90                   	nop
f01009ab:	90                   	nop
f01009ac:	90                   	nop
f01009ad:	90                   	nop
f01009ae:	90                   	nop
f01009af:	90                   	nop
f01009b0:	90                   	nop
f01009b1:	90                   	nop
f01009b2:	90                   	nop
f01009b3:	90                   	nop
f01009b4:	90                   	nop
f01009b5:	90                   	nop
f01009b6:	90                   	nop
f01009b7:	90                   	nop
f01009b8:	90                   	nop
f01009b9:	90                   	nop
f01009ba:	90                   	nop
f01009bb:	90                   	nop
f01009bc:	90                   	nop
f01009bd:	90                   	nop
f01009be:	90                   	nop
f01009bf:	90                   	nop
f01009c0:	90                   	nop
f01009c1:	90                   	nop
f01009c2:	90                   	nop
f01009c3:	90                   	nop
f01009c4:	90                   	nop
f01009c5:	90                   	nop
f01009c6:	90                   	nop
f01009c7:	90                   	nop
f01009c8:	90                   	nop
f01009c9:	90                   	nop
f01009ca:	90                   	nop
f01009cb:	90                   	nop
f01009cc:	90                   	nop
f01009cd:	90                   	nop
f01009ce:	90                   	nop
f01009cf:	90                   	nop
f01009d0:	90                   	nop
f01009d1:	90                   	nop
f01009d2:	90                   	nop
f01009d3:	90                   	nop
f01009d4:	90                   	nop
f01009d5:	90                   	nop
f01009d6:	90                   	nop
f01009d7:	90                   	nop
f01009d8:	90                   	nop
f01009d9:	90                   	nop
f01009da:	90                   	nop
f01009db:	90                   	nop
f01009dc:	90                   	nop
f01009dd:	90                   	nop
f01009de:	90                   	nop
f01009df:	90                   	nop
f01009e0:	90                   	nop
f01009e1:	90                   	nop
f01009e2:	90                   	nop
f01009e3:	90                   	nop
f01009e4:	90                   	nop
f01009e5:	90                   	nop
f01009e6:	90                   	nop
f01009e7:	90                   	nop
f01009e8:	90                   	nop
f01009e9:	90                   	nop
f01009ea:	90                   	nop
f01009eb:	90                   	nop
f01009ec:	90                   	nop
f01009ed:	90                   	nop
f01009ee:	90                   	nop
f01009ef:	90                   	nop
f01009f0:	90                   	nop
f01009f1:	90                   	nop
f01009f2:	90                   	nop
f01009f3:	90                   	nop
f01009f4:	90                   	nop
f01009f5:	90                   	nop
f01009f6:	90                   	nop
f01009f7:	90                   	nop
f01009f8:	90                   	nop
f01009f9:	90                   	nop
f01009fa:	90                   	nop
f01009fb:	90                   	nop
f01009fc:	90                   	nop
f01009fd:	90                   	nop
f01009fe:	90                   	nop
f01009ff:	90                   	nop
f0100a00:	90                   	nop
f0100a01:	90                   	nop
f0100a02:	90                   	nop
f0100a03:	90                   	nop
f0100a04:	90                   	nop
f0100a05:	90                   	nop
f0100a06:	90                   	nop
f0100a07:	90                   	nop
f0100a08:	90                   	nop
f0100a09:	90                   	nop
f0100a0a:	90                   	nop
f0100a0b:	90                   	nop
f0100a0c:	90                   	nop
f0100a0d:	90                   	nop
f0100a0e:	90                   	nop
f0100a0f:	90                   	nop
f0100a10:	90                   	nop
f0100a11:	90                   	nop
f0100a12:	90                   	nop
f0100a13:	90                   	nop
f0100a14:	90                   	nop
f0100a15:	90                   	nop
f0100a16:	90                   	nop
f0100a17:	90                   	nop
f0100a18:	90                   	nop
f0100a19:	90                   	nop
f0100a1a:	90                   	nop
f0100a1b:	90                   	nop
f0100a1c:	90                   	nop
f0100a1d:	90                   	nop
f0100a1e:	90                   	nop
f0100a1f:	90                   	nop
f0100a20:	90                   	nop
f0100a21:	90                   	nop
f0100a22:	90                   	nop
f0100a23:	90                   	nop
f0100a24:	90                   	nop
f0100a25:	90                   	nop
f0100a26:	90                   	nop
f0100a27:	90                   	nop
f0100a28:	90                   	nop
f0100a29:	90                   	nop
f0100a2a:	90                   	nop
f0100a2b:	90                   	nop
f0100a2c:	90                   	nop
f0100a2d:	90                   	nop
f0100a2e:	90                   	nop
f0100a2f:	90                   	nop
f0100a30:	90                   	nop
f0100a31:	90                   	nop
f0100a32:	90                   	nop
f0100a33:	90                   	nop
f0100a34:	90                   	nop
f0100a35:	90                   	nop
f0100a36:	90                   	nop
f0100a37:	90                   	nop
f0100a38:	90                   	nop
f0100a39:	90                   	nop
f0100a3a:	90                   	nop
f0100a3b:	90                   	nop
f0100a3c:	90                   	nop
f0100a3d:	90                   	nop
f0100a3e:	90                   	nop
f0100a3f:	90                   	nop
f0100a40:	90                   	nop
f0100a41:	90                   	nop
f0100a42:	90                   	nop
f0100a43:	90                   	nop
f0100a44:	90                   	nop
f0100a45:	90                   	nop
f0100a46:	90                   	nop
f0100a47:	90                   	nop
f0100a48:	90                   	nop
f0100a49:	90                   	nop
f0100a4a:	90                   	nop
f0100a4b:	90                   	nop
f0100a4c:	90                   	nop
f0100a4d:	90                   	nop
f0100a4e:	90                   	nop
f0100a4f:	90                   	nop
f0100a50:	90                   	nop
f0100a51:	90                   	nop
f0100a52:	90                   	nop
f0100a53:	90                   	nop
f0100a54:	90                   	nop
f0100a55:	90                   	nop
f0100a56:	90                   	nop
f0100a57:	90                   	nop
f0100a58:	90                   	nop
f0100a59:	90                   	nop
f0100a5a:	90                   	nop
f0100a5b:	90                   	nop
f0100a5c:	90                   	nop
f0100a5d:	90                   	nop
f0100a5e:	90                   	nop
f0100a5f:	90                   	nop
f0100a60:	90                   	nop
f0100a61:	90                   	nop
f0100a62:	90                   	nop
f0100a63:	90                   	nop
f0100a64:	90                   	nop
f0100a65:	90                   	nop
f0100a66:	90                   	nop
f0100a67:	90                   	nop
f0100a68:	90                   	nop
f0100a69:	90                   	nop
f0100a6a:	90                   	nop
f0100a6b:	90                   	nop
f0100a6c:	90                   	nop
f0100a6d:	90                   	nop
f0100a6e:	90                   	nop
f0100a6f:	90                   	nop
f0100a70:	90                   	nop
f0100a71:	90                   	nop
f0100a72:	90                   	nop
f0100a73:	90                   	nop
f0100a74:	90                   	nop
f0100a75:	90                   	nop
f0100a76:	90                   	nop
f0100a77:	90                   	nop
f0100a78:	90                   	nop
f0100a79:	90                   	nop
f0100a7a:	90                   	nop
f0100a7b:	90                   	nop
f0100a7c:	90                   	nop
f0100a7d:	90                   	nop
f0100a7e:	90                   	nop
f0100a7f:	90                   	nop
f0100a80:	90                   	nop
f0100a81:	90                   	nop
f0100a82:	90                   	nop
f0100a83:	90                   	nop
f0100a84:	90                   	nop
f0100a85:	90                   	nop
f0100a86:	90                   	nop
f0100a87:	90                   	nop
f0100a88:	90                   	nop
f0100a89:	90                   	nop
f0100a8a:	90                   	nop
f0100a8b:	90                   	nop
f0100a8c:	90                   	nop
f0100a8d:	90                   	nop
f0100a8e:	90                   	nop
f0100a8f:	90                   	nop
f0100a90:	90                   	nop
f0100a91:	90                   	nop
f0100a92:	90                   	nop
f0100a93:	90                   	nop
f0100a94:	90                   	nop
f0100a95:	90                   	nop
f0100a96:	90                   	nop
f0100a97:	90                   	nop
f0100a98:	90                   	nop
f0100a99:	90                   	nop
f0100a9a:	90                   	nop
f0100a9b:	90                   	nop
f0100a9c:	90                   	nop
f0100a9d:	90                   	nop
f0100a9e:	90                   	nop
f0100a9f:	90                   	nop
f0100aa0:	90                   	nop
f0100aa1:	90                   	nop
f0100aa2:	90                   	nop
f0100aa3:	90                   	nop
f0100aa4:	90                   	nop
f0100aa5:	90                   	nop
f0100aa6:	90                   	nop
f0100aa7:	90                   	nop
f0100aa8:	90                   	nop
f0100aa9:	90                   	nop
f0100aaa:	90                   	nop
f0100aab:	90                   	nop
f0100aac:	90                   	nop
f0100aad:	90                   	nop
f0100aae:	90                   	nop
f0100aaf:	90                   	nop
f0100ab0:	90                   	nop
f0100ab1:	90                   	nop
f0100ab2:	90                   	nop
f0100ab3:	90                   	nop
f0100ab4:	90                   	nop
f0100ab5:	90                   	nop
f0100ab6:	90                   	nop
f0100ab7:	90                   	nop
f0100ab8:	90                   	nop
f0100ab9:	90                   	nop
f0100aba:	90                   	nop
f0100abb:	90                   	nop
f0100abc:	90                   	nop
f0100abd:	90                   	nop
f0100abe:	90                   	nop
f0100abf:	90                   	nop
f0100ac0:	90                   	nop
f0100ac1:	90                   	nop
f0100ac2:	90                   	nop
f0100ac3:	90                   	nop
f0100ac4:	90                   	nop
f0100ac5:	90                   	nop
f0100ac6:	90                   	nop
f0100ac7:	90                   	nop
f0100ac8:	90                   	nop
f0100ac9:	90                   	nop
f0100aca:	90                   	nop
f0100acb:	90                   	nop
f0100acc:	90                   	nop
f0100acd:	90                   	nop
f0100ace:	90                   	nop
f0100acf:	90                   	nop
f0100ad0:	90                   	nop
f0100ad1:	90                   	nop
f0100ad2:	90                   	nop
f0100ad3:	90                   	nop
f0100ad4:	90                   	nop
f0100ad5:	90                   	nop
f0100ad6:	90                   	nop
f0100ad7:	90                   	nop
f0100ad8:	90                   	nop
f0100ad9:	90                   	nop
f0100ada:	90                   	nop
f0100adb:	90                   	nop
f0100adc:	90                   	nop
f0100add:	90                   	nop
f0100ade:	90                   	nop
f0100adf:	90                   	nop
f0100ae0:	90                   	nop
f0100ae1:	90                   	nop
f0100ae2:	90                   	nop
f0100ae3:	90                   	nop
f0100ae4:	90                   	nop
f0100ae5:	90                   	nop
f0100ae6:	90                   	nop
f0100ae7:	90                   	nop
f0100ae8:	90                   	nop
f0100ae9:	90                   	nop
f0100aea:	90                   	nop
f0100aeb:	90                   	nop
f0100aec:	90                   	nop
f0100aed:	90                   	nop
f0100aee:	90                   	nop
f0100aef:	90                   	nop
f0100af0:	90                   	nop
f0100af1:	90                   	nop
f0100af2:	90                   	nop
f0100af3:	90                   	nop
f0100af4:	90                   	nop
f0100af5:	90                   	nop
f0100af6:	90                   	nop
f0100af7:	90                   	nop
f0100af8:	90                   	nop
f0100af9:	90                   	nop
f0100afa:	90                   	nop
f0100afb:	90                   	nop
f0100afc:	90                   	nop
f0100afd:	90                   	nop
f0100afe:	90                   	nop
f0100aff:	90                   	nop
f0100b00:	90                   	nop
f0100b01:	90                   	nop
f0100b02:	90                   	nop
f0100b03:	90                   	nop
f0100b04:	90                   	nop
f0100b05:	90                   	nop
f0100b06:	90                   	nop
f0100b07:	90                   	nop
f0100b08:	90                   	nop
f0100b09:	90                   	nop
f0100b0a:	90                   	nop
f0100b0b:	90                   	nop
f0100b0c:	90                   	nop
f0100b0d:	90                   	nop
f0100b0e:	90                   	nop
f0100b0f:	90                   	nop
f0100b10:	90                   	nop
f0100b11:	90                   	nop
f0100b12:	90                   	nop
f0100b13:	90                   	nop
f0100b14:	90                   	nop
f0100b15:	90                   	nop
f0100b16:	90                   	nop
f0100b17:	90                   	nop
f0100b18:	90                   	nop
f0100b19:	90                   	nop
f0100b1a:	90                   	nop
f0100b1b:	90                   	nop
f0100b1c:	90                   	nop
f0100b1d:	90                   	nop
f0100b1e:	90                   	nop
f0100b1f:	90                   	nop
f0100b20:	90                   	nop
f0100b21:	90                   	nop
f0100b22:	90                   	nop
f0100b23:	90                   	nop
f0100b24:	90                   	nop
f0100b25:	90                   	nop
f0100b26:	90                   	nop
f0100b27:	90                   	nop
f0100b28:	90                   	nop
f0100b29:	90                   	nop
f0100b2a:	90                   	nop
f0100b2b:	90                   	nop
f0100b2c:	90                   	nop
f0100b2d:	90                   	nop
f0100b2e:	90                   	nop
f0100b2f:	90                   	nop
f0100b30:	90                   	nop
f0100b31:	90                   	nop
f0100b32:	90                   	nop
f0100b33:	90                   	nop
f0100b34:	90                   	nop
f0100b35:	90                   	nop
f0100b36:	90                   	nop
f0100b37:	90                   	nop
f0100b38:	90                   	nop
f0100b39:	90                   	nop
f0100b3a:	90                   	nop
f0100b3b:	90                   	nop
f0100b3c:	90                   	nop
f0100b3d:	90                   	nop
f0100b3e:	90                   	nop
f0100b3f:	90                   	nop
f0100b40:	90                   	nop
f0100b41:	90                   	nop
f0100b42:	90                   	nop
f0100b43:	90                   	nop
f0100b44:	90                   	nop
f0100b45:	90                   	nop
f0100b46:	90                   	nop
f0100b47:	90                   	nop
f0100b48:	90                   	nop
f0100b49:	90                   	nop
f0100b4a:	90                   	nop
f0100b4b:	90                   	nop
f0100b4c:	90                   	nop
f0100b4d:	90                   	nop
f0100b4e:	90                   	nop
f0100b4f:	90                   	nop
f0100b50:	90                   	nop
f0100b51:	90                   	nop
f0100b52:	90                   	nop
f0100b53:	90                   	nop
f0100b54:	90                   	nop
f0100b55:	90                   	nop
f0100b56:	90                   	nop
f0100b57:	90                   	nop
f0100b58:	90                   	nop
f0100b59:	90                   	nop
f0100b5a:	90                   	nop
f0100b5b:	90                   	nop
f0100b5c:	90                   	nop
f0100b5d:	90                   	nop
f0100b5e:	90                   	nop
f0100b5f:	90                   	nop
f0100b60:	90                   	nop
f0100b61:	90                   	nop
f0100b62:	90                   	nop
f0100b63:	90                   	nop
f0100b64:	90                   	nop
f0100b65:	90                   	nop
f0100b66:	90                   	nop
f0100b67:	90                   	nop
f0100b68:	90                   	nop
f0100b69:	90                   	nop
f0100b6a:	90                   	nop
f0100b6b:	90                   	nop
f0100b6c:	90                   	nop
f0100b6d:	90                   	nop
f0100b6e:	90                   	nop
f0100b6f:	90                   	nop
f0100b70:	90                   	nop
f0100b71:	90                   	nop
f0100b72:	90                   	nop
f0100b73:	90                   	nop
f0100b74:	90                   	nop
f0100b75:	90                   	nop
f0100b76:	90                   	nop
f0100b77:	90                   	nop
f0100b78:	90                   	nop
f0100b79:	90                   	nop
f0100b7a:	90                   	nop
f0100b7b:	90                   	nop
f0100b7c:	90                   	nop
f0100b7d:	90                   	nop
f0100b7e:	90                   	nop
f0100b7f:	90                   	nop
f0100b80:	90                   	nop
f0100b81:	90                   	nop
f0100b82:	90                   	nop
f0100b83:	90                   	nop
f0100b84:	90                   	nop
f0100b85:	90                   	nop
f0100b86:	90                   	nop
f0100b87:	90                   	nop
f0100b88:	90                   	nop
f0100b89:	90                   	nop
f0100b8a:	90                   	nop
f0100b8b:	90                   	nop
f0100b8c:	90                   	nop
f0100b8d:	90                   	nop
f0100b8e:	90                   	nop
f0100b8f:	90                   	nop
f0100b90:	90                   	nop
f0100b91:	90                   	nop
f0100b92:	90                   	nop
f0100b93:	90                   	nop
f0100b94:	90                   	nop
f0100b95:	90                   	nop
f0100b96:	90                   	nop
f0100b97:	90                   	nop
f0100b98:	90                   	nop
f0100b99:	90                   	nop
f0100b9a:	90                   	nop
f0100b9b:	90                   	nop
f0100b9c:	90                   	nop
f0100b9d:	90                   	nop
f0100b9e:	90                   	nop
f0100b9f:	90                   	nop
f0100ba0:	90                   	nop
f0100ba1:	90                   	nop
f0100ba2:	90                   	nop
f0100ba3:	90                   	nop
f0100ba4:	90                   	nop
f0100ba5:	90                   	nop
f0100ba6:	90                   	nop
f0100ba7:	90                   	nop
f0100ba8:	90                   	nop
f0100ba9:	90                   	nop
f0100baa:	90                   	nop
f0100bab:	90                   	nop
f0100bac:	90                   	nop
f0100bad:	90                   	nop
f0100bae:	90                   	nop
f0100baf:	90                   	nop
f0100bb0:	90                   	nop
f0100bb1:	90                   	nop
f0100bb2:	90                   	nop
f0100bb3:	90                   	nop
f0100bb4:	90                   	nop
f0100bb5:	90                   	nop
f0100bb6:	90                   	nop
f0100bb7:	90                   	nop
f0100bb8:	90                   	nop
f0100bb9:	90                   	nop
f0100bba:	90                   	nop
f0100bbb:	90                   	nop
f0100bbc:	90                   	nop
f0100bbd:	90                   	nop
f0100bbe:	90                   	nop
f0100bbf:	90                   	nop
f0100bc0:	90                   	nop
f0100bc1:	90                   	nop
f0100bc2:	90                   	nop
f0100bc3:	90                   	nop
f0100bc4:	90                   	nop
f0100bc5:	90                   	nop
f0100bc6:	90                   	nop
f0100bc7:	90                   	nop
f0100bc8:	90                   	nop
f0100bc9:	90                   	nop
f0100bca:	90                   	nop
f0100bcb:	90                   	nop
f0100bcc:	90                   	nop
f0100bcd:	90                   	nop
f0100bce:	90                   	nop
f0100bcf:	90                   	nop
f0100bd0:	90                   	nop
f0100bd1:	90                   	nop
f0100bd2:	90                   	nop
f0100bd3:	90                   	nop
f0100bd4:	90                   	nop
f0100bd5:	90                   	nop
f0100bd6:	90                   	nop
f0100bd7:	90                   	nop
f0100bd8:	90                   	nop
f0100bd9:	90                   	nop
f0100bda:	90                   	nop
f0100bdb:	90                   	nop
f0100bdc:	90                   	nop
f0100bdd:	90                   	nop
f0100bde:	90                   	nop
f0100bdf:	90                   	nop
f0100be0:	90                   	nop
f0100be1:	90                   	nop
f0100be2:	90                   	nop
f0100be3:	90                   	nop
f0100be4:	90                   	nop
f0100be5:	90                   	nop
f0100be6:	90                   	nop
f0100be7:	90                   	nop
f0100be8:	90                   	nop
f0100be9:	90                   	nop
f0100bea:	90                   	nop
f0100beb:	90                   	nop
f0100bec:	90                   	nop
f0100bed:	90                   	nop
f0100bee:	90                   	nop
f0100bef:	90                   	nop
f0100bf0:	90                   	nop
f0100bf1:	90                   	nop
f0100bf2:	90                   	nop
f0100bf3:	90                   	nop
f0100bf4:	90                   	nop
f0100bf5:	90                   	nop
f0100bf6:	90                   	nop
f0100bf7:	90                   	nop
f0100bf8:	90                   	nop
f0100bf9:	90                   	nop
f0100bfa:	90                   	nop
f0100bfb:	90                   	nop
f0100bfc:	90                   	nop
f0100bfd:	90                   	nop
f0100bfe:	90                   	nop
f0100bff:	90                   	nop
f0100c00:	90                   	nop
f0100c01:	90                   	nop
f0100c02:	90                   	nop
f0100c03:	90                   	nop
f0100c04:	90                   	nop
f0100c05:	90                   	nop
f0100c06:	90                   	nop
f0100c07:	90                   	nop
f0100c08:	90                   	nop
f0100c09:	90                   	nop
f0100c0a:	90                   	nop
f0100c0b:	90                   	nop
f0100c0c:	90                   	nop
f0100c0d:	90                   	nop
f0100c0e:	90                   	nop
f0100c0f:	90                   	nop
f0100c10:	90                   	nop
f0100c11:	90                   	nop
f0100c12:	90                   	nop
f0100c13:	90                   	nop
f0100c14:	90                   	nop
f0100c15:	90                   	nop
f0100c16:	90                   	nop
f0100c17:	90                   	nop
f0100c18:	90                   	nop
f0100c19:	90                   	nop
f0100c1a:	90                   	nop
f0100c1b:	90                   	nop
f0100c1c:	90                   	nop
f0100c1d:	90                   	nop
f0100c1e:	90                   	nop
f0100c1f:	90                   	nop
f0100c20:	90                   	nop
f0100c21:	90                   	nop
f0100c22:	90                   	nop
f0100c23:	90                   	nop
f0100c24:	90                   	nop
f0100c25:	90                   	nop
f0100c26:	90                   	nop
f0100c27:	90                   	nop
f0100c28:	90                   	nop
f0100c29:	90                   	nop
f0100c2a:	90                   	nop
f0100c2b:	90                   	nop
f0100c2c:	90                   	nop
f0100c2d:	90                   	nop
f0100c2e:	90                   	nop
f0100c2f:	90                   	nop
f0100c30:	90                   	nop
f0100c31:	90                   	nop
f0100c32:	90                   	nop
f0100c33:	90                   	nop
f0100c34:	90                   	nop
f0100c35:	90                   	nop
f0100c36:	90                   	nop
f0100c37:	90                   	nop
f0100c38:	90                   	nop
f0100c39:	90                   	nop
f0100c3a:	90                   	nop
f0100c3b:	90                   	nop
f0100c3c:	90                   	nop
f0100c3d:	90                   	nop
f0100c3e:	90                   	nop
f0100c3f:	90                   	nop
f0100c40:	90                   	nop
f0100c41:	90                   	nop
f0100c42:	90                   	nop
f0100c43:	90                   	nop
f0100c44:	90                   	nop
f0100c45:	90                   	nop
f0100c46:	90                   	nop
f0100c47:	90                   	nop
f0100c48:	90                   	nop
f0100c49:	90                   	nop
f0100c4a:	90                   	nop
f0100c4b:	90                   	nop
f0100c4c:	90                   	nop
f0100c4d:	90                   	nop
f0100c4e:	90                   	nop
f0100c4f:	90                   	nop
f0100c50:	90                   	nop
f0100c51:	90                   	nop
f0100c52:	90                   	nop
f0100c53:	90                   	nop
f0100c54:	90                   	nop
f0100c55:	90                   	nop
f0100c56:	90                   	nop
f0100c57:	90                   	nop
f0100c58:	90                   	nop
f0100c59:	90                   	nop
f0100c5a:	90                   	nop
f0100c5b:	90                   	nop
f0100c5c:	90                   	nop
f0100c5d:	90                   	nop
f0100c5e:	90                   	nop
f0100c5f:	90                   	nop
f0100c60:	90                   	nop
f0100c61:	90                   	nop
f0100c62:	90                   	nop
f0100c63:	90                   	nop
f0100c64:	90                   	nop
f0100c65:	90                   	nop
f0100c66:	90                   	nop
f0100c67:	90                   	nop
f0100c68:	90                   	nop
f0100c69:	90                   	nop
f0100c6a:	90                   	nop
f0100c6b:	90                   	nop
f0100c6c:	90                   	nop
f0100c6d:	90                   	nop
f0100c6e:	90                   	nop
f0100c6f:	90                   	nop
f0100c70:	90                   	nop
f0100c71:	90                   	nop
f0100c72:	90                   	nop
f0100c73:	90                   	nop
f0100c74:	90                   	nop
f0100c75:	90                   	nop
f0100c76:	90                   	nop
f0100c77:	90                   	nop
f0100c78:	90                   	nop
f0100c79:	90                   	nop
f0100c7a:	90                   	nop
f0100c7b:	90                   	nop
f0100c7c:	90                   	nop
f0100c7d:	90                   	nop
f0100c7e:	90                   	nop
f0100c7f:	90                   	nop
f0100c80:	90                   	nop
f0100c81:	90                   	nop
f0100c82:	90                   	nop
f0100c83:	90                   	nop
f0100c84:	90                   	nop
f0100c85:	90                   	nop
f0100c86:	90                   	nop
f0100c87:	90                   	nop
f0100c88:	90                   	nop
f0100c89:	90                   	nop
f0100c8a:	90                   	nop
f0100c8b:	90                   	nop
f0100c8c:	90                   	nop
f0100c8d:	90                   	nop
f0100c8e:	90                   	nop
f0100c8f:	90                   	nop
f0100c90:	90                   	nop
f0100c91:	90                   	nop
f0100c92:	90                   	nop
f0100c93:	90                   	nop
f0100c94:	90                   	nop
f0100c95:	90                   	nop
f0100c96:	90                   	nop
f0100c97:	90                   	nop
f0100c98:	90                   	nop
f0100c99:	90                   	nop
f0100c9a:	90                   	nop
f0100c9b:	90                   	nop
f0100c9c:	90                   	nop
f0100c9d:	90                   	nop
f0100c9e:	90                   	nop
f0100c9f:	90                   	nop
f0100ca0:	90                   	nop
f0100ca1:	90                   	nop
f0100ca2:	90                   	nop
f0100ca3:	90                   	nop
f0100ca4:	90                   	nop
f0100ca5:	90                   	nop
f0100ca6:	90                   	nop
f0100ca7:	90                   	nop
f0100ca8:	90                   	nop
f0100ca9:	90                   	nop
f0100caa:	90                   	nop
f0100cab:	90                   	nop
f0100cac:	90                   	nop
f0100cad:	90                   	nop
f0100cae:	90                   	nop
f0100caf:	90                   	nop
f0100cb0:	90                   	nop
f0100cb1:	90                   	nop
f0100cb2:	90                   	nop
f0100cb3:	90                   	nop
f0100cb4:	90                   	nop
f0100cb5:	90                   	nop
f0100cb6:	90                   	nop
f0100cb7:	90                   	nop
f0100cb8:	90                   	nop
f0100cb9:	90                   	nop
f0100cba:	90                   	nop
f0100cbb:	90                   	nop
f0100cbc:	90                   	nop
f0100cbd:	90                   	nop
f0100cbe:	90                   	nop
f0100cbf:	90                   	nop
f0100cc0:	90                   	nop
f0100cc1:	90                   	nop
f0100cc2:	90                   	nop
f0100cc3:	90                   	nop
f0100cc4:	90                   	nop
f0100cc5:	90                   	nop
f0100cc6:	90                   	nop
f0100cc7:	90                   	nop
f0100cc8:	90                   	nop
f0100cc9:	90                   	nop
f0100cca:	90                   	nop
f0100ccb:	90                   	nop
f0100ccc:	90                   	nop
f0100ccd:	90                   	nop
f0100cce:	90                   	nop
f0100ccf:	90                   	nop
f0100cd0:	90                   	nop
f0100cd1:	90                   	nop
f0100cd2:	90                   	nop
f0100cd3:	90                   	nop
f0100cd4:	90                   	nop
f0100cd5:	90                   	nop
f0100cd6:	90                   	nop
f0100cd7:	90                   	nop
f0100cd8:	90                   	nop
f0100cd9:	90                   	nop
f0100cda:	90                   	nop
f0100cdb:	90                   	nop
f0100cdc:	90                   	nop
f0100cdd:	90                   	nop
f0100cde:	90                   	nop
f0100cdf:	90                   	nop
f0100ce0:	90                   	nop
f0100ce1:	90                   	nop
f0100ce2:	90                   	nop
f0100ce3:	90                   	nop
f0100ce4:	90                   	nop
f0100ce5:	90                   	nop
f0100ce6:	90                   	nop
f0100ce7:	90                   	nop
f0100ce8:	90                   	nop
f0100ce9:	90                   	nop
f0100cea:	90                   	nop
f0100ceb:	90                   	nop
f0100cec:	90                   	nop
f0100ced:	90                   	nop
f0100cee:	90                   	nop
f0100cef:	90                   	nop
f0100cf0:	90                   	nop
f0100cf1:	90                   	nop
f0100cf2:	90                   	nop
f0100cf3:	90                   	nop
f0100cf4:	90                   	nop
f0100cf5:	90                   	nop
f0100cf6:	90                   	nop
f0100cf7:	90                   	nop
f0100cf8:	90                   	nop
f0100cf9:	90                   	nop
f0100cfa:	90                   	nop
f0100cfb:	90                   	nop
f0100cfc:	90                   	nop
f0100cfd:	90                   	nop
f0100cfe:	90                   	nop
f0100cff:	90                   	nop
f0100d00:	90                   	nop
f0100d01:	90                   	nop
f0100d02:	90                   	nop
f0100d03:	90                   	nop
f0100d04:	90                   	nop
f0100d05:	90                   	nop
f0100d06:	90                   	nop
f0100d07:	90                   	nop
f0100d08:	90                   	nop
f0100d09:	90                   	nop
f0100d0a:	90                   	nop
f0100d0b:	90                   	nop
f0100d0c:	90                   	nop
f0100d0d:	90                   	nop
f0100d0e:	90                   	nop
f0100d0f:	90                   	nop
f0100d10:	90                   	nop
f0100d11:	90                   	nop
f0100d12:	90                   	nop
f0100d13:	90                   	nop
f0100d14:	90                   	nop
f0100d15:	90                   	nop
f0100d16:	90                   	nop
f0100d17:	90                   	nop
f0100d18:	90                   	nop
f0100d19:	90                   	nop
f0100d1a:	90                   	nop
f0100d1b:	90                   	nop
f0100d1c:	90                   	nop
f0100d1d:	90                   	nop
f0100d1e:	90                   	nop
f0100d1f:	90                   	nop
f0100d20:	90                   	nop
f0100d21:	90                   	nop
f0100d22:	90                   	nop
f0100d23:	90                   	nop
f0100d24:	90                   	nop
f0100d25:	90                   	nop
f0100d26:	90                   	nop
f0100d27:	90                   	nop
f0100d28:	90                   	nop
f0100d29:	90                   	nop
f0100d2a:	90                   	nop
f0100d2b:	90                   	nop
f0100d2c:	90                   	nop
f0100d2d:	90                   	nop
f0100d2e:	90                   	nop
f0100d2f:	90                   	nop
f0100d30:	90                   	nop
f0100d31:	90                   	nop
f0100d32:	90                   	nop
f0100d33:	90                   	nop
f0100d34:	90                   	nop
f0100d35:	90                   	nop
f0100d36:	90                   	nop
f0100d37:	90                   	nop
f0100d38:	90                   	nop
f0100d39:	90                   	nop
f0100d3a:	90                   	nop
f0100d3b:	90                   	nop
f0100d3c:	90                   	nop
f0100d3d:	90                   	nop
f0100d3e:	90                   	nop
f0100d3f:	90                   	nop
f0100d40:	90                   	nop
f0100d41:	90                   	nop
f0100d42:	90                   	nop
f0100d43:	90                   	nop
f0100d44:	90                   	nop
f0100d45:	90                   	nop
f0100d46:	90                   	nop
f0100d47:	90                   	nop
f0100d48:	90                   	nop
f0100d49:	90                   	nop
f0100d4a:	90                   	nop
f0100d4b:	90                   	nop
f0100d4c:	90                   	nop
f0100d4d:	90                   	nop
f0100d4e:	90                   	nop
f0100d4f:	90                   	nop
f0100d50:	90                   	nop
f0100d51:	90                   	nop
f0100d52:	90                   	nop
f0100d53:	90                   	nop
f0100d54:	90                   	nop
f0100d55:	90                   	nop
f0100d56:	90                   	nop
f0100d57:	90                   	nop
f0100d58:	90                   	nop
f0100d59:	90                   	nop
f0100d5a:	90                   	nop
f0100d5b:	90                   	nop
f0100d5c:	90                   	nop
f0100d5d:	90                   	nop
f0100d5e:	90                   	nop
f0100d5f:	90                   	nop
f0100d60:	90                   	nop
f0100d61:	90                   	nop
f0100d62:	90                   	nop
f0100d63:	90                   	nop
f0100d64:	90                   	nop
f0100d65:	90                   	nop
f0100d66:	90                   	nop
f0100d67:	90                   	nop
f0100d68:	90                   	nop
f0100d69:	90                   	nop
f0100d6a:	90                   	nop
f0100d6b:	90                   	nop
f0100d6c:	90                   	nop
f0100d6d:	90                   	nop
f0100d6e:	90                   	nop
f0100d6f:	90                   	nop
f0100d70:	90                   	nop
f0100d71:	90                   	nop
f0100d72:	90                   	nop
f0100d73:	90                   	nop
f0100d74:	90                   	nop
f0100d75:	90                   	nop
f0100d76:	90                   	nop
f0100d77:	90                   	nop
f0100d78:	90                   	nop
f0100d79:	90                   	nop
f0100d7a:	90                   	nop
f0100d7b:	90                   	nop
f0100d7c:	90                   	nop
f0100d7d:	90                   	nop
f0100d7e:	90                   	nop
f0100d7f:	90                   	nop
f0100d80:	90                   	nop
f0100d81:	90                   	nop
f0100d82:	90                   	nop
f0100d83:	90                   	nop
f0100d84:	90                   	nop
f0100d85:	90                   	nop
f0100d86:	90                   	nop
f0100d87:	90                   	nop
f0100d88:	90                   	nop
f0100d89:	90                   	nop
f0100d8a:	90                   	nop
f0100d8b:	90                   	nop
f0100d8c:	90                   	nop
f0100d8d:	90                   	nop
f0100d8e:	90                   	nop
f0100d8f:	90                   	nop
f0100d90:	90                   	nop
f0100d91:	90                   	nop
f0100d92:	90                   	nop
f0100d93:	90                   	nop
f0100d94:	90                   	nop
f0100d95:	90                   	nop
f0100d96:	90                   	nop
f0100d97:	90                   	nop
f0100d98:	90                   	nop
f0100d99:	90                   	nop
f0100d9a:	90                   	nop
f0100d9b:	90                   	nop
f0100d9c:	90                   	nop
f0100d9d:	90                   	nop
f0100d9e:	90                   	nop
f0100d9f:	90                   	nop
f0100da0:	90                   	nop
f0100da1:	90                   	nop
f0100da2:	90                   	nop
f0100da3:	90                   	nop
f0100da4:	90                   	nop
f0100da5:	90                   	nop
f0100da6:	90                   	nop
f0100da7:	90                   	nop
f0100da8:	90                   	nop
f0100da9:	90                   	nop
f0100daa:	90                   	nop
f0100dab:	90                   	nop
f0100dac:	90                   	nop
f0100dad:	90                   	nop
f0100dae:	90                   	nop
f0100daf:	90                   	nop
f0100db0:	90                   	nop
f0100db1:	90                   	nop
f0100db2:	90                   	nop
f0100db3:	90                   	nop
f0100db4:	90                   	nop
f0100db5:	90                   	nop
f0100db6:	90                   	nop
f0100db7:	90                   	nop
f0100db8:	90                   	nop
f0100db9:	90                   	nop
f0100dba:	90                   	nop
f0100dbb:	90                   	nop
f0100dbc:	90                   	nop
f0100dbd:	90                   	nop
f0100dbe:	90                   	nop
f0100dbf:	90                   	nop
f0100dc0:	90                   	nop
f0100dc1:	90                   	nop
f0100dc2:	90                   	nop
f0100dc3:	90                   	nop
f0100dc4:	90                   	nop
f0100dc5:	90                   	nop
f0100dc6:	90                   	nop
f0100dc7:	90                   	nop
f0100dc8:	90                   	nop
f0100dc9:	90                   	nop
f0100dca:	90                   	nop
f0100dcb:	90                   	nop
f0100dcc:	90                   	nop
f0100dcd:	90                   	nop
f0100dce:	90                   	nop
f0100dcf:	90                   	nop
f0100dd0:	90                   	nop
f0100dd1:	90                   	nop
f0100dd2:	90                   	nop
f0100dd3:	90                   	nop
f0100dd4:	90                   	nop
f0100dd5:	90                   	nop
f0100dd6:	90                   	nop
f0100dd7:	90                   	nop
f0100dd8:	90                   	nop
f0100dd9:	90                   	nop
f0100dda:	90                   	nop
f0100ddb:	90                   	nop
f0100ddc:	90                   	nop
f0100ddd:	90                   	nop
f0100dde:	90                   	nop
f0100ddf:	90                   	nop
f0100de0:	90                   	nop
f0100de1:	90                   	nop
f0100de2:	90                   	nop
f0100de3:	90                   	nop
f0100de4:	90                   	nop
f0100de5:	90                   	nop
f0100de6:	90                   	nop
f0100de7:	90                   	nop
f0100de8:	90                   	nop
f0100de9:	90                   	nop
f0100dea:	90                   	nop
f0100deb:	90                   	nop
f0100dec:	90                   	nop
f0100ded:	90                   	nop
f0100dee:	90                   	nop
f0100def:	90                   	nop
f0100df0:	90                   	nop
f0100df1:	90                   	nop
f0100df2:	90                   	nop
f0100df3:	90                   	nop
f0100df4:	90                   	nop
f0100df5:	90                   	nop
f0100df6:	90                   	nop
f0100df7:	90                   	nop
f0100df8:	90                   	nop
f0100df9:	90                   	nop
f0100dfa:	90                   	nop
f0100dfb:	90                   	nop
f0100dfc:	90                   	nop
f0100dfd:	90                   	nop
f0100dfe:	90                   	nop
f0100dff:	90                   	nop
f0100e00:	90                   	nop
f0100e01:	90                   	nop
f0100e02:	90                   	nop
f0100e03:	90                   	nop
f0100e04:	90                   	nop
f0100e05:	90                   	nop
f0100e06:	90                   	nop
f0100e07:	90                   	nop
f0100e08:	90                   	nop
f0100e09:	90                   	nop
f0100e0a:	90                   	nop
f0100e0b:	90                   	nop
f0100e0c:	90                   	nop
f0100e0d:	90                   	nop
f0100e0e:	90                   	nop
f0100e0f:	90                   	nop
f0100e10:	90                   	nop
f0100e11:	90                   	nop
f0100e12:	90                   	nop
f0100e13:	90                   	nop
f0100e14:	90                   	nop
f0100e15:	90                   	nop
f0100e16:	90                   	nop
f0100e17:	90                   	nop
f0100e18:	90                   	nop
f0100e19:	90                   	nop
f0100e1a:	90                   	nop
f0100e1b:	90                   	nop
f0100e1c:	90                   	nop
f0100e1d:	90                   	nop
f0100e1e:	90                   	nop
f0100e1f:	90                   	nop
f0100e20:	90                   	nop
f0100e21:	90                   	nop
f0100e22:	90                   	nop
f0100e23:	90                   	nop
f0100e24:	90                   	nop
f0100e25:	90                   	nop
f0100e26:	90                   	nop
f0100e27:	90                   	nop
f0100e28:	90                   	nop
f0100e29:	90                   	nop
f0100e2a:	90                   	nop
f0100e2b:	90                   	nop
f0100e2c:	90                   	nop
f0100e2d:	90                   	nop
f0100e2e:	90                   	nop
f0100e2f:	90                   	nop
f0100e30:	90                   	nop
f0100e31:	90                   	nop
f0100e32:	90                   	nop
f0100e33:	90                   	nop
f0100e34:	90                   	nop
f0100e35:	90                   	nop
f0100e36:	90                   	nop
f0100e37:	90                   	nop
f0100e38:	90                   	nop
f0100e39:	90                   	nop
f0100e3a:	90                   	nop
f0100e3b:	90                   	nop
f0100e3c:	90                   	nop
f0100e3d:	90                   	nop
f0100e3e:	90                   	nop
f0100e3f:	90                   	nop
f0100e40:	90                   	nop
f0100e41:	90                   	nop
f0100e42:	90                   	nop
f0100e43:	90                   	nop
f0100e44:	90                   	nop
f0100e45:	90                   	nop
f0100e46:	90                   	nop
f0100e47:	90                   	nop
f0100e48:	90                   	nop
f0100e49:	90                   	nop
f0100e4a:	90                   	nop
f0100e4b:	90                   	nop
f0100e4c:	90                   	nop
f0100e4d:	90                   	nop
f0100e4e:	90                   	nop
f0100e4f:	90                   	nop
f0100e50:	90                   	nop
f0100e51:	90                   	nop
f0100e52:	90                   	nop
f0100e53:	90                   	nop
f0100e54:	90                   	nop
f0100e55:	90                   	nop
f0100e56:	90                   	nop
f0100e57:	90                   	nop
f0100e58:	90                   	nop
f0100e59:	90                   	nop
f0100e5a:	90                   	nop
f0100e5b:	90                   	nop
f0100e5c:	90                   	nop
f0100e5d:	90                   	nop
f0100e5e:	90                   	nop
f0100e5f:	90                   	nop
f0100e60:	90                   	nop
f0100e61:	90                   	nop
f0100e62:	90                   	nop
f0100e63:	90                   	nop
f0100e64:	90                   	nop
f0100e65:	90                   	nop
f0100e66:	90                   	nop
f0100e67:	90                   	nop
f0100e68:	90                   	nop
f0100e69:	90                   	nop
f0100e6a:	90                   	nop
f0100e6b:	90                   	nop
f0100e6c:	90                   	nop
f0100e6d:	90                   	nop
f0100e6e:	90                   	nop
f0100e6f:	90                   	nop
f0100e70:	90                   	nop
f0100e71:	90                   	nop
f0100e72:	90                   	nop
f0100e73:	90                   	nop
f0100e74:	90                   	nop
f0100e75:	90                   	nop
f0100e76:	90                   	nop
f0100e77:	90                   	nop
f0100e78:	90                   	nop
f0100e79:	90                   	nop
f0100e7a:	90                   	nop
f0100e7b:	90                   	nop
f0100e7c:	90                   	nop
f0100e7d:	90                   	nop
f0100e7e:	90                   	nop
f0100e7f:	90                   	nop
f0100e80:	90                   	nop
f0100e81:	90                   	nop
f0100e82:	90                   	nop
f0100e83:	90                   	nop
f0100e84:	90                   	nop
f0100e85:	90                   	nop
f0100e86:	90                   	nop
f0100e87:	90                   	nop
f0100e88:	90                   	nop
f0100e89:	90                   	nop
f0100e8a:	90                   	nop
f0100e8b:	90                   	nop
f0100e8c:	90                   	nop
f0100e8d:	90                   	nop
f0100e8e:	90                   	nop
f0100e8f:	90                   	nop
f0100e90:	90                   	nop
f0100e91:	90                   	nop
f0100e92:	90                   	nop
f0100e93:	90                   	nop
f0100e94:	90                   	nop
f0100e95:	90                   	nop
f0100e96:	90                   	nop
f0100e97:	90                   	nop
f0100e98:	90                   	nop
f0100e99:	90                   	nop
f0100e9a:	90                   	nop
f0100e9b:	90                   	nop
f0100e9c:	90                   	nop
f0100e9d:	90                   	nop
f0100e9e:	90                   	nop
f0100e9f:	90                   	nop
f0100ea0:	90                   	nop
f0100ea1:	90                   	nop
f0100ea2:	90                   	nop
f0100ea3:	90                   	nop
f0100ea4:	90                   	nop
f0100ea5:	90                   	nop
f0100ea6:	90                   	nop
f0100ea7:	90                   	nop
f0100ea8:	90                   	nop
f0100ea9:	90                   	nop
f0100eaa:	90                   	nop
f0100eab:	90                   	nop
f0100eac:	90                   	nop
f0100ead:	90                   	nop
f0100eae:	90                   	nop
f0100eaf:	90                   	nop
f0100eb0:	90                   	nop
f0100eb1:	90                   	nop
f0100eb2:	90                   	nop
f0100eb3:	90                   	nop
f0100eb4:	90                   	nop
f0100eb5:	90                   	nop
f0100eb6:	90                   	nop
f0100eb7:	90                   	nop
f0100eb8:	90                   	nop
f0100eb9:	90                   	nop
f0100eba:	90                   	nop
f0100ebb:	90                   	nop
f0100ebc:	90                   	nop
f0100ebd:	90                   	nop
f0100ebe:	90                   	nop
f0100ebf:	90                   	nop
f0100ec0:	90                   	nop
f0100ec1:	90                   	nop
f0100ec2:	90                   	nop
f0100ec3:	90                   	nop
f0100ec4:	90                   	nop
f0100ec5:	90                   	nop
f0100ec6:	90                   	nop
f0100ec7:	90                   	nop
f0100ec8:	90                   	nop
f0100ec9:	90                   	nop
f0100eca:	90                   	nop
f0100ecb:	90                   	nop
f0100ecc:	90                   	nop
f0100ecd:	90                   	nop
f0100ece:	90                   	nop
f0100ecf:	90                   	nop
f0100ed0:	90                   	nop
f0100ed1:	90                   	nop
f0100ed2:	90                   	nop
f0100ed3:	90                   	nop
f0100ed4:	90                   	nop
f0100ed5:	90                   	nop
f0100ed6:	90                   	nop
f0100ed7:	90                   	nop
f0100ed8:	90                   	nop
f0100ed9:	90                   	nop
f0100eda:	90                   	nop
f0100edb:	90                   	nop
f0100edc:	90                   	nop
f0100edd:	90                   	nop
f0100ede:	90                   	nop
f0100edf:	90                   	nop
f0100ee0:	90                   	nop
f0100ee1:	90                   	nop
f0100ee2:	90                   	nop
f0100ee3:	90                   	nop
f0100ee4:	90                   	nop
f0100ee5:	90                   	nop
f0100ee6:	90                   	nop
f0100ee7:	90                   	nop
f0100ee8:	90                   	nop
f0100ee9:	90                   	nop
f0100eea:	90                   	nop
f0100eeb:	90                   	nop
f0100eec:	90                   	nop
f0100eed:	90                   	nop
f0100eee:	90                   	nop
f0100eef:	90                   	nop
f0100ef0:	90                   	nop
f0100ef1:	90                   	nop
f0100ef2:	90                   	nop
f0100ef3:	90                   	nop
f0100ef4:	90                   	nop
f0100ef5:	90                   	nop
f0100ef6:	90                   	nop
f0100ef7:	90                   	nop
f0100ef8:	90                   	nop
f0100ef9:	90                   	nop
f0100efa:	90                   	nop
f0100efb:	90                   	nop
f0100efc:	90                   	nop
f0100efd:	90                   	nop
f0100efe:	90                   	nop
f0100eff:	90                   	nop
f0100f00:	90                   	nop
f0100f01:	90                   	nop
f0100f02:	90                   	nop
f0100f03:	90                   	nop
f0100f04:	90                   	nop
f0100f05:	90                   	nop
f0100f06:	90                   	nop
f0100f07:	90                   	nop
f0100f08:	90                   	nop
f0100f09:	90                   	nop
f0100f0a:	90                   	nop
f0100f0b:	90                   	nop
f0100f0c:	90                   	nop
f0100f0d:	90                   	nop
f0100f0e:	90                   	nop
f0100f0f:	90                   	nop
f0100f10:	90                   	nop
f0100f11:	90                   	nop
f0100f12:	90                   	nop
f0100f13:	90                   	nop
f0100f14:	90                   	nop
f0100f15:	90                   	nop
f0100f16:	90                   	nop
f0100f17:	90                   	nop
f0100f18:	90                   	nop
f0100f19:	90                   	nop
f0100f1a:	90                   	nop
f0100f1b:	90                   	nop
f0100f1c:	90                   	nop
f0100f1d:	90                   	nop
f0100f1e:	90                   	nop
f0100f1f:	90                   	nop
f0100f20:	90                   	nop
f0100f21:	90                   	nop
f0100f22:	90                   	nop
f0100f23:	90                   	nop
f0100f24:	90                   	nop
f0100f25:	90                   	nop
f0100f26:	90                   	nop
f0100f27:	90                   	nop
f0100f28:	90                   	nop
f0100f29:	90                   	nop
f0100f2a:	90                   	nop
f0100f2b:	90                   	nop
f0100f2c:	90                   	nop
f0100f2d:	90                   	nop
f0100f2e:	90                   	nop
f0100f2f:	90                   	nop
f0100f30:	90                   	nop
f0100f31:	90                   	nop
f0100f32:	90                   	nop
f0100f33:	90                   	nop
f0100f34:	90                   	nop
f0100f35:	90                   	nop
f0100f36:	90                   	nop
f0100f37:	90                   	nop
f0100f38:	90                   	nop
f0100f39:	90                   	nop
f0100f3a:	90                   	nop
f0100f3b:	90                   	nop
f0100f3c:	90                   	nop
f0100f3d:	90                   	nop
f0100f3e:	90                   	nop
f0100f3f:	90                   	nop
f0100f40:	90                   	nop
f0100f41:	90                   	nop
f0100f42:	90                   	nop
f0100f43:	90                   	nop
f0100f44:	90                   	nop
f0100f45:	90                   	nop
f0100f46:	90                   	nop
f0100f47:	90                   	nop
f0100f48:	90                   	nop
f0100f49:	90                   	nop
f0100f4a:	90                   	nop
f0100f4b:	90                   	nop
f0100f4c:	90                   	nop
f0100f4d:	90                   	nop
f0100f4e:	90                   	nop
f0100f4f:	90                   	nop
f0100f50:	90                   	nop
f0100f51:	90                   	nop
f0100f52:	90                   	nop
f0100f53:	90                   	nop
f0100f54:	90                   	nop
f0100f55:	90                   	nop
f0100f56:	90                   	nop
f0100f57:	90                   	nop
f0100f58:	90                   	nop
f0100f59:	90                   	nop
f0100f5a:	90                   	nop
f0100f5b:	90                   	nop
f0100f5c:	90                   	nop
f0100f5d:	90                   	nop
f0100f5e:	90                   	nop
f0100f5f:	90                   	nop
f0100f60:	90                   	nop
f0100f61:	90                   	nop
f0100f62:	90                   	nop
f0100f63:	90                   	nop
f0100f64:	90                   	nop
f0100f65:	90                   	nop
f0100f66:	90                   	nop
f0100f67:	90                   	nop
f0100f68:	90                   	nop
f0100f69:	90                   	nop
f0100f6a:	90                   	nop
f0100f6b:	90                   	nop
f0100f6c:	90                   	nop
f0100f6d:	90                   	nop
f0100f6e:	90                   	nop
f0100f6f:	90                   	nop
f0100f70:	90                   	nop
f0100f71:	90                   	nop
f0100f72:	90                   	nop
f0100f73:	90                   	nop
f0100f74:	90                   	nop
f0100f75:	90                   	nop
f0100f76:	90                   	nop
f0100f77:	90                   	nop
f0100f78:	90                   	nop
f0100f79:	90                   	nop
f0100f7a:	90                   	nop
f0100f7b:	90                   	nop
f0100f7c:	90                   	nop
f0100f7d:	90                   	nop
f0100f7e:	90                   	nop
f0100f7f:	90                   	nop
f0100f80:	90                   	nop
f0100f81:	90                   	nop
f0100f82:	90                   	nop
f0100f83:	90                   	nop
f0100f84:	90                   	nop
f0100f85:	90                   	nop
f0100f86:	90                   	nop
f0100f87:	90                   	nop
f0100f88:	90                   	nop
f0100f89:	90                   	nop
f0100f8a:	90                   	nop
f0100f8b:	90                   	nop
f0100f8c:	90                   	nop
f0100f8d:	90                   	nop
f0100f8e:	90                   	nop
f0100f8f:	90                   	nop
f0100f90:	90                   	nop
f0100f91:	90                   	nop
f0100f92:	90                   	nop
f0100f93:	90                   	nop
f0100f94:	90                   	nop
f0100f95:	90                   	nop
f0100f96:	90                   	nop
f0100f97:	90                   	nop
f0100f98:	90                   	nop
f0100f99:	90                   	nop
f0100f9a:	90                   	nop
f0100f9b:	90                   	nop
f0100f9c:	90                   	nop
f0100f9d:	90                   	nop
f0100f9e:	90                   	nop
f0100f9f:	90                   	nop
f0100fa0:	90                   	nop
f0100fa1:	90                   	nop
f0100fa2:	90                   	nop
f0100fa3:	90                   	nop
f0100fa4:	90                   	nop
f0100fa5:	90                   	nop
f0100fa6:	90                   	nop
f0100fa7:	90                   	nop
f0100fa8:	90                   	nop
f0100fa9:	90                   	nop
f0100faa:	90                   	nop
f0100fab:	90                   	nop
f0100fac:	90                   	nop
f0100fad:	90                   	nop
f0100fae:	90                   	nop
f0100faf:	90                   	nop
f0100fb0:	90                   	nop
f0100fb1:	90                   	nop
f0100fb2:	90                   	nop
f0100fb3:	90                   	nop
f0100fb4:	90                   	nop
f0100fb5:	90                   	nop
f0100fb6:	90                   	nop
f0100fb7:	90                   	nop
f0100fb8:	90                   	nop
f0100fb9:	90                   	nop
f0100fba:	90                   	nop
f0100fbb:	90                   	nop
f0100fbc:	90                   	nop
f0100fbd:	90                   	nop
f0100fbe:	90                   	nop
f0100fbf:	90                   	nop
f0100fc0:	90                   	nop
f0100fc1:	90                   	nop
f0100fc2:	90                   	nop
f0100fc3:	90                   	nop
f0100fc4:	90                   	nop
f0100fc5:	90                   	nop
f0100fc6:	90                   	nop
f0100fc7:	90                   	nop
f0100fc8:	90                   	nop
f0100fc9:	90                   	nop
f0100fca:	90                   	nop
f0100fcb:	90                   	nop
f0100fcc:	90                   	nop
f0100fcd:	90                   	nop
f0100fce:	90                   	nop
f0100fcf:	90                   	nop
f0100fd0:	90                   	nop
f0100fd1:	90                   	nop
f0100fd2:	90                   	nop
f0100fd3:	90                   	nop
f0100fd4:	90                   	nop
f0100fd5:	90                   	nop
f0100fd6:	90                   	nop
f0100fd7:	90                   	nop
f0100fd8:	90                   	nop
f0100fd9:	90                   	nop
f0100fda:	90                   	nop
f0100fdb:	90                   	nop
f0100fdc:	90                   	nop
f0100fdd:	90                   	nop
f0100fde:	90                   	nop
f0100fdf:	90                   	nop
f0100fe0:	90                   	nop
f0100fe1:	90                   	nop
f0100fe2:	90                   	nop
f0100fe3:	90                   	nop
f0100fe4:	90                   	nop
f0100fe5:	90                   	nop
f0100fe6:	90                   	nop
f0100fe7:	90                   	nop
f0100fe8:	90                   	nop
f0100fe9:	90                   	nop
f0100fea:	90                   	nop
f0100feb:	90                   	nop
f0100fec:	90                   	nop
f0100fed:	90                   	nop
f0100fee:	90                   	nop
f0100fef:	90                   	nop
f0100ff0:	90                   	nop
f0100ff1:	90                   	nop
f0100ff2:	90                   	nop
f0100ff3:	90                   	nop
f0100ff4:	90                   	nop
f0100ff5:	90                   	nop
f0100ff6:	90                   	nop
f0100ff7:	90                   	nop
f0100ff8:	90                   	nop
f0100ff9:	90                   	nop
f0100ffa:	90                   	nop
f0100ffb:	90                   	nop
f0100ffc:	90                   	nop
f0100ffd:	90                   	nop
f0100ffe:	90                   	nop
f0100fff:	90                   	nop

f0101000 <bootstack>:
	...

f0109000 <bootstacktop>:
	...
f0109008:	ff                   	(bad)  
f0109009:	ff 00                	incl   (%eax)
f010900b:	00 00                	add    %al,(%eax)
f010900d:	9a cf 10 ff ff 00 00 	lcall  $0x0,$0xffff10cf
f0109014:	00 92 cf 10 17 00    	add    %dl,0x1710cf(%edx)

f0109018 <mygdtdesc>:
f0109018:	17                   	pop    %ss
f0109019:	00 00                	add    %al,(%eax)
f010901b:	90                   	nop
f010901c:	10 00                	adc    %al,(%eax)
	...

f0109020 <_Z5_warnPKciS0_z>:
}

/* like panic, but don't */
void
_warn(const char *file, int line, const char *fmt, ...)
{
f0109020:	55                   	push   %ebp
f0109021:	89 e5                	mov    %esp,%ebp
f0109023:	83 ec 18             	sub    $0x18,%esp
	va_list ap;

	va_start(ap, fmt);
	cprintf("kernel warning at %s:%d: ", file, line);
f0109026:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109029:	89 44 24 08          	mov    %eax,0x8(%esp)
f010902d:	8b 45 08             	mov    0x8(%ebp),%eax
f0109030:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109034:	c7 04 24 00 ce 10 f0 	movl   $0xf010ce00,(%esp)
f010903b:	e8 37 2a 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	vcprintf(fmt, ap);
f0109040:	8d 45 14             	lea    0x14(%ebp),%eax
f0109043:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109047:	8b 45 10             	mov    0x10(%ebp),%eax
f010904a:	89 04 24             	mov    %eax,(%esp)
f010904d:	e8 f2 29 00 00       	call   f010ba44 <_Z8vcprintfPKcPc>
	cprintf("\n");
f0109052:	c7 04 24 d5 dc 10 f0 	movl   $0xf010dcd5,(%esp)
f0109059:	e8 19 2a 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	va_end(ap);
}
f010905e:	c9                   	leave  
f010905f:	c3                   	ret    

f0109060 <_Z6_panicPKciS0_z>:
 * Panic is called on unresolvable fatal errors.
 * It prints "panic: mesg", and then enters the kernel monitor.
 */
void
_panic(const char *file, int line, const char *fmt, ...)
{
f0109060:	55                   	push   %ebp
f0109061:	89 e5                	mov    %esp,%ebp
f0109063:	83 ec 18             	sub    $0x18,%esp
	va_list ap;

	if (panicstr)
f0109066:	83 3d e0 90 11 f0 00 	cmpl   $0x0,0xf01190e0
f010906d:	75 40                	jne    f01090af <_Z6_panicPKciS0_z+0x4f>
		goto dead;
	panicstr = fmt;
f010906f:	8b 45 10             	mov    0x10(%ebp),%eax
f0109072:	a3 e0 90 11 f0       	mov    %eax,0xf01190e0

	va_start(ap, fmt);
	cprintf("kernel panic at %s:%d: ", file, line);
f0109077:	8b 45 0c             	mov    0xc(%ebp),%eax
f010907a:	89 44 24 08          	mov    %eax,0x8(%esp)
f010907e:	8b 45 08             	mov    0x8(%ebp),%eax
f0109081:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109085:	c7 04 24 1a ce 10 f0 	movl   $0xf010ce1a,(%esp)
f010908c:	e8 e6 29 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	vcprintf(fmt, ap);
f0109091:	8d 45 14             	lea    0x14(%ebp),%eax
f0109094:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109098:	8b 45 10             	mov    0x10(%ebp),%eax
f010909b:	89 04 24             	mov    %eax,(%esp)
f010909e:	e8 a1 29 00 00       	call   f010ba44 <_Z8vcprintfPKcPc>
	cprintf("\n");
f01090a3:	c7 04 24 d5 dc 10 f0 	movl   $0xf010dcd5,(%esp)
f01090aa:	e8 c8 29 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	va_end(ap);

dead:
	/* break into the kernel monitor */
	while (1)
		monitor(NULL);
f01090af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f01090b6:	e8 cd 08 00 00       	call   f0109988 <_Z7monitorP9Trapframe>
f01090bb:	eb f2                	jmp    f01090af <_Z6_panicPKciS0_z+0x4f>

f01090bd <i386_init>:


extern "C" {
void
i386_init(void)
{
f01090bd:	55                   	push   %ebp
f01090be:	89 e5                	mov    %esp,%ebp
f01090c0:	53                   	push   %ebx
f01090c1:	83 ec 14             	sub    $0x14,%esp
	extern const uint32_t sctors[], ectors[];
	const uint32_t *ctorva;

	// Initialize the console.
	// Can't call cprintf until after we do this!
	cons_init();
f01090c4:	e8 ae 01 00 00       	call   f0109277 <_Z9cons_initv>

	// Then call any global constructors.
	// This relies on linker script magic to define the 'sctors' and
	// 'ectors' symbols; see kern/kernel.ld.
	// Call after cons_init() so we can cprintf() if necessary.
	for (ctorva = ectors; ctorva > sctors; )
f01090c9:	b8 04 90 11 f0       	mov    $0xf0119004,%eax
f01090ce:	3d 00 90 11 f0       	cmp    $0xf0119000,%eax
f01090d3:	76 0f                	jbe    f01090e4 <i386_init+0x27>
f01090d5:	89 c3                	mov    %eax,%ebx
		((void(*)()) *--ctorva)();
f01090d7:	83 eb 04             	sub    $0x4,%ebx
f01090da:	ff 13                	call   *(%ebx)

	// Then call any global constructors.
	// This relies on linker script magic to define the 'sctors' and
	// 'ectors' symbols; see kern/kernel.ld.
	// Call after cons_init() so we can cprintf() if necessary.
	for (ctorva = ectors; ctorva > sctors; )
f01090dc:	81 fb 00 90 11 f0    	cmp    $0xf0119000,%ebx
f01090e2:	77 f3                	ja     f01090d7 <i386_init+0x1a>
		((void(*)()) *--ctorva)();

	cprintf("6828 decimal is %o octal!\n", 6828);
f01090e4:	c7 44 24 04 ac 1a 00 	movl   $0x1aac,0x4(%esp)
f01090eb:	00 
f01090ec:	c7 04 24 32 ce 10 f0 	movl   $0xf010ce32,(%esp)
f01090f3:	e8 7f 29 00 00       	call   f010ba77 <_Z7cprintfPKcz>

	// Lab 2 memory management initialization functions
	mem_init();
f01090f8:	e8 16 14 00 00       	call   f010a513 <_Z8mem_initv>

	// Lab 2 interrupt and gate descriptor initialization functions
	idt_init();
f01090fd:	e8 d3 29 00 00       	call   f010bad5 <_Z8idt_initv>

	// Test IDT (lab 2 only)
	__asm__ __volatile__("int3");
f0109102:	cc                   	int3   
	cprintf("Breakpoint succeeded!\n");
f0109103:	c7 04 24 4d ce 10 f0 	movl   $0xf010ce4d,(%esp)
f010910a:	e8 68 29 00 00       	call   f010ba77 <_Z7cprintfPKcz>

	// Drop into the kernel monitor.
	while (1)
		monitor(NULL);
f010910f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f0109116:	e8 6d 08 00 00       	call   f0109988 <_Z7monitorP9Trapframe>
f010911b:	eb f2                	jmp    f010910f <i386_init+0x52>
f010911d:	00 00                	add    %al,(%eax)
	...

f0109120 <_Z16serial_proc_datav>:

static bool serial_exists;

int
serial_proc_data(void)
{
f0109120:	55                   	push   %ebp
f0109121:	89 e5                	mov    %esp,%ebp

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f0109123:	ba fd 03 00 00       	mov    $0x3fd,%edx
f0109128:	ec                   	in     (%dx),%al
f0109129:	89 c2                	mov    %eax,%edx
	if (!(inb(COM1+COM_LSR) & COM_LSR_DATA))
f010912b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f0109130:	f6 c2 01             	test   $0x1,%dl
f0109133:	74 09                	je     f010913e <_Z16serial_proc_datav+0x1e>
f0109135:	ba f8 03 00 00       	mov    $0x3f8,%edx
f010913a:	ec                   	in     (%dx),%al
		return -1;
	return inb(COM1+COM_RX);
f010913b:	0f b6 c0             	movzbl %al,%eax
}
f010913e:	5d                   	pop    %ebp
f010913f:	c3                   	ret    

f0109140 <_Z11serial_initv>:
		cons_intr(serial_proc_data);
}

void
serial_init(void)
{
f0109140:	55                   	push   %ebp
f0109141:	89 e5                	mov    %esp,%ebp
f0109143:	53                   	push   %ebx
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f0109144:	bb fa 03 00 00       	mov    $0x3fa,%ebx
f0109149:	b8 00 00 00 00       	mov    $0x0,%eax
f010914e:	89 da                	mov    %ebx,%edx
f0109150:	ee                   	out    %al,(%dx)
f0109151:	b2 fb                	mov    $0xfb,%dl
f0109153:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
f0109158:	ee                   	out    %al,(%dx)
f0109159:	b9 f8 03 00 00       	mov    $0x3f8,%ecx
f010915e:	b8 0c 00 00 00       	mov    $0xc,%eax
f0109163:	89 ca                	mov    %ecx,%edx
f0109165:	ee                   	out    %al,(%dx)
f0109166:	b2 f9                	mov    $0xf9,%dl
f0109168:	b8 00 00 00 00       	mov    $0x0,%eax
f010916d:	ee                   	out    %al,(%dx)
f010916e:	b2 fb                	mov    $0xfb,%dl
f0109170:	b8 03 00 00 00       	mov    $0x3,%eax
f0109175:	ee                   	out    %al,(%dx)
f0109176:	b2 fc                	mov    $0xfc,%dl
f0109178:	b8 00 00 00 00       	mov    $0x0,%eax
f010917d:	ee                   	out    %al,(%dx)
f010917e:	b2 f9                	mov    $0xf9,%dl
f0109180:	b8 01 00 00 00       	mov    $0x1,%eax
f0109185:	ee                   	out    %al,(%dx)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f0109186:	b2 fd                	mov    $0xfd,%dl
f0109188:	ec                   	in     (%dx),%al
	// Enable rcv interrupts
	outb(COM1+COM_IER, COM_IER_RDI);

	// Clear any preexisting overrun indications and interrupts
	// Serial port doesn't exist if COM_LSR returns 0xFF
	serial_exists = (inb(COM1+COM_LSR) != 0xFF);
f0109189:	3c ff                	cmp    $0xff,%al
f010918b:	0f 95 05 00 91 11 f0 	setne  0xf0119100
f0109192:	89 da                	mov    %ebx,%edx
f0109194:	ec                   	in     (%dx),%al
f0109195:	89 ca                	mov    %ecx,%edx
f0109197:	ec                   	in     (%dx),%al
	(void) inb(COM1+COM_IIR);
	(void) inb(COM1+COM_RX);

}
f0109198:	5b                   	pop    %ebx
f0109199:	5d                   	pop    %ebp
f010919a:	c3                   	ret    

f010919b <_Z8kbd_initv>:
	cons_intr(kbd_proc_data);
}

void
kbd_init(void)
{
f010919b:	55                   	push   %ebp
f010919c:	89 e5                	mov    %esp,%ebp
}
f010919e:	5d                   	pop    %ebp
f010919f:	c3                   	ret    

f01091a0 <_Z9cons_intrPFivE>:

// called by device interrupt routines to feed input characters
// into the circular console input buffer.
void
cons_intr(int (*proc)(void))
{
f01091a0:	55                   	push   %ebp
f01091a1:	89 e5                	mov    %esp,%ebp
f01091a3:	57                   	push   %edi
f01091a4:	56                   	push   %esi
f01091a5:	53                   	push   %ebx
f01091a6:	83 ec 0c             	sub    $0xc,%esp
f01091a9:	8b 75 08             	mov    0x8(%ebp),%esi
	int c;

	while ((c = (*proc)()) != -1) {
		if (c == 0)
			continue;
		cons.buf[cons.wpos++] = c;
f01091ac:	bb 24 e3 11 f0       	mov    $0xf011e324,%ebx
f01091b1:	bf 20 e1 11 f0       	mov    $0xf011e120,%edi
void
cons_intr(int (*proc)(void))
{
	int c;

	while ((c = (*proc)()) != -1) {
f01091b6:	eb 1e                	jmp    f01091d6 <_Z9cons_intrPFivE+0x36>
		if (c == 0)
f01091b8:	85 c0                	test   %eax,%eax
f01091ba:	74 1a                	je     f01091d6 <_Z9cons_intrPFivE+0x36>
			continue;
		cons.buf[cons.wpos++] = c;
f01091bc:	8b 13                	mov    (%ebx),%edx
f01091be:	88 04 17             	mov    %al,(%edi,%edx,1)
f01091c1:	8d 42 01             	lea    0x1(%edx),%eax
		if (cons.wpos == CONSBUFSIZE)
f01091c4:	3d 00 02 00 00       	cmp    $0x200,%eax
			cons.wpos = 0;
f01091c9:	0f 94 c2             	sete   %dl
f01091cc:	0f b6 d2             	movzbl %dl,%edx
f01091cf:	83 ea 01             	sub    $0x1,%edx
f01091d2:	21 d0                	and    %edx,%eax
f01091d4:	89 03                	mov    %eax,(%ebx)
void
cons_intr(int (*proc)(void))
{
	int c;

	while ((c = (*proc)()) != -1) {
f01091d6:	ff d6                	call   *%esi
f01091d8:	83 f8 ff             	cmp    $0xffffffff,%eax
f01091db:	75 db                	jne    f01091b8 <_Z9cons_intrPFivE+0x18>
			continue;
		cons.buf[cons.wpos++] = c;
		if (cons.wpos == CONSBUFSIZE)
			cons.wpos = 0;
	}
}
f01091dd:	83 c4 0c             	add    $0xc,%esp
f01091e0:	5b                   	pop    %ebx
f01091e1:	5e                   	pop    %esi
f01091e2:	5f                   	pop    %edi
f01091e3:	5d                   	pop    %ebp
f01091e4:	c3                   	ret    

f01091e5 <_Z8kbd_intrv>:
	return c;
}

void
kbd_intr(void)
{
f01091e5:	55                   	push   %ebp
f01091e6:	89 e5                	mov    %esp,%ebp
f01091e8:	83 ec 18             	sub    $0x18,%esp
	cons_intr(kbd_proc_data);
f01091eb:	c7 04 24 09 94 10 f0 	movl   $0xf0109409,(%esp)
f01091f2:	e8 a9 ff ff ff       	call   f01091a0 <_Z9cons_intrPFivE>
}
f01091f7:	c9                   	leave  
f01091f8:	c3                   	ret    

f01091f9 <_Z11serial_intrv>:
	return inb(COM1+COM_RX);
}

void
serial_intr(void)
{
f01091f9:	55                   	push   %ebp
f01091fa:	89 e5                	mov    %esp,%ebp
f01091fc:	83 ec 18             	sub    $0x18,%esp
	if (serial_exists)
f01091ff:	80 3d 00 91 11 f0 00 	cmpb   $0x0,0xf0119100
f0109206:	74 0c                	je     f0109214 <_Z11serial_intrv+0x1b>
		cons_intr(serial_proc_data);
f0109208:	c7 04 24 20 91 10 f0 	movl   $0xf0109120,(%esp)
f010920f:	e8 8c ff ff ff       	call   f01091a0 <_Z9cons_intrPFivE>
}
f0109214:	c9                   	leave  
f0109215:	c3                   	ret    

f0109216 <_Z9cons_getcv>:
}

// return the next input character from the console, or 0 if none waiting
int
cons_getc(void)
{
f0109216:	55                   	push   %ebp
f0109217:	89 e5                	mov    %esp,%ebp
f0109219:	83 ec 08             	sub    $0x8,%esp
	int c;

	// poll for any pending input characters,
	// so that this function works even when interrupts are disabled
	// (e.g., when called from the kernel monitor).
	serial_intr();
f010921c:	e8 d8 ff ff ff       	call   f01091f9 <_Z11serial_intrv>
	kbd_intr();
f0109221:	e8 bf ff ff ff       	call   f01091e5 <_Z8kbd_intrv>

	// grab the next character from the input buffer.
	if (cons.rpos != cons.wpos) {
f0109226:	8b 15 20 e3 11 f0    	mov    0xf011e320,%edx
f010922c:	b8 00 00 00 00       	mov    $0x0,%eax
f0109231:	3b 15 24 e3 11 f0    	cmp    0xf011e324,%edx
f0109237:	74 21                	je     f010925a <_Z9cons_getcv+0x44>
		c = cons.buf[cons.rpos++];
f0109239:	0f b6 82 20 e1 11 f0 	movzbl -0xfee1ee0(%edx),%eax
f0109240:	83 c2 01             	add    $0x1,%edx
		if (cons.rpos == CONSBUFSIZE)
f0109243:	81 fa 00 02 00 00    	cmp    $0x200,%edx
			cons.rpos = 0;
f0109249:	0f 94 c1             	sete   %cl
f010924c:	0f b6 c9             	movzbl %cl,%ecx
f010924f:	83 e9 01             	sub    $0x1,%ecx
f0109252:	21 ca                	and    %ecx,%edx
f0109254:	89 15 20 e3 11 f0    	mov    %edx,0xf011e320
		return c;
	}
	return 0;
}
f010925a:	c9                   	leave  
f010925b:	c3                   	ret    

f010925c <_Z7getcharv>:
	cons_putc(c);
}

int
getchar(void)
{
f010925c:	55                   	push   %ebp
f010925d:	89 e5                	mov    %esp,%ebp
f010925f:	83 ec 08             	sub    $0x8,%esp
	int c;

	while ((c = cons_getc()) == 0)
f0109262:	e8 af ff ff ff       	call   f0109216 <_Z9cons_getcv>
f0109267:	85 c0                	test   %eax,%eax
f0109269:	74 f7                	je     f0109262 <_Z7getcharv+0x6>
		/* do nothing */;
	return c;
}
f010926b:	c9                   	leave  
f010926c:	c3                   	ret    

f010926d <_Z6isconsi>:

int
iscons(int fdnum)
{
f010926d:	55                   	push   %ebp
f010926e:	89 e5                	mov    %esp,%ebp
	// used by readline
	return 1;
}
f0109270:	b8 01 00 00 00       	mov    $0x1,%eax
f0109275:	5d                   	pop    %ebp
f0109276:	c3                   	ret    

f0109277 <_Z9cons_initv>:
}

// initialize the console devices
void
cons_init(void)
{
f0109277:	55                   	push   %ebp
f0109278:	89 e5                	mov    %esp,%ebp
f010927a:	83 ec 28             	sub    $0x28,%esp
f010927d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f0109280:	89 75 f8             	mov    %esi,-0x8(%ebp)
f0109283:	89 7d fc             	mov    %edi,-0x4(%ebp)

static void
cga_init(void)
{
	volatile uint16_t *cp = (uint16_t*) (KERNBASE + CGA_BUF);
	uint16_t was = *cp;
f0109286:	b8 00 80 0b f0       	mov    $0xf00b8000,%eax
f010928b:	0f b7 10             	movzwl (%eax),%edx
	*cp = (uint16_t) 0xA55A;
f010928e:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
	if (*cp != 0xA55A) {
f0109293:	0f b7 00             	movzwl (%eax),%eax
f0109296:	66 3d 5a a5          	cmp    $0xa55a,%ax
f010929a:	74 11                	je     f01092ad <_Z9cons_initv+0x36>
		cp = (uint16_t*) (KERNBASE + MONO_BUF);
		addr_6845 = MONO_BASE;
f010929c:	c7 05 04 91 11 f0 b4 	movl   $0x3b4,0xf0119104
f01092a3:	03 00 00 
f01092a6:	be 00 00 0b f0       	mov    $0xf00b0000,%esi
f01092ab:	eb 16                	jmp    f01092c3 <_Z9cons_initv+0x4c>
	} else {
		*cp = was;
f01092ad:	66 89 15 00 80 0b f0 	mov    %dx,0xf00b8000
		addr_6845 = CGA_BASE;
f01092b4:	c7 05 04 91 11 f0 d4 	movl   $0x3d4,0xf0119104
f01092bb:	03 00 00 
f01092be:	be 00 80 0b f0       	mov    $0xf00b8000,%esi
	}
	
	/* Extract cursor location */
	outb(addr_6845, 14);
f01092c3:	8b 0d 04 91 11 f0    	mov    0xf0119104,%ecx
f01092c9:	89 cb                	mov    %ecx,%ebx
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f01092cb:	b8 0e 00 00 00       	mov    $0xe,%eax
f01092d0:	89 ca                	mov    %ecx,%edx
f01092d2:	ee                   	out    %al,(%dx)
	unsigned pos = inb(addr_6845 + 1) << 8;
f01092d3:	83 c1 01             	add    $0x1,%ecx

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f01092d6:	89 ca                	mov    %ecx,%edx
f01092d8:	ec                   	in     (%dx),%al
f01092d9:	0f b6 f8             	movzbl %al,%edi
f01092dc:	c1 e7 08             	shl    $0x8,%edi
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f01092df:	b8 0f 00 00 00       	mov    $0xf,%eax
f01092e4:	89 da                	mov    %ebx,%edx
f01092e6:	ee                   	out    %al,(%dx)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f01092e7:	89 ca                	mov    %ecx,%edx
f01092e9:	ec                   	in     (%dx),%al
	outb(addr_6845, 15);
	pos |= inb(addr_6845 + 1);

	crt_buf = (uint16_t*) cp;
f01092ea:	89 35 08 91 11 f0    	mov    %esi,0xf0119108
	crt_pos = pos;
f01092f0:	0f b6 c8             	movzbl %al,%ecx
f01092f3:	09 cf                	or     %ecx,%edi
f01092f5:	66 89 3d 0c 91 11 f0 	mov    %di,0xf011910c
void
cons_init(void)
{
	cga_init();
	kbd_init();
	serial_init();
f01092fc:	e8 3f fe ff ff       	call   f0109140 <_Z11serial_initv>

	if (!serial_exists)
f0109301:	80 3d 00 91 11 f0 00 	cmpb   $0x0,0xf0119100
f0109308:	75 0c                	jne    f0109316 <_Z9cons_initv+0x9f>
		cprintf("Serial port does not exist!\n");
f010930a:	c7 04 24 64 ce 10 f0 	movl   $0xf010ce64,(%esp)
f0109311:	e8 61 27 00 00       	call   f010ba77 <_Z7cprintfPKcz>
}
f0109316:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f0109319:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010931c:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010931f:	89 ec                	mov    %ebp,%esp
f0109321:	5d                   	pop    %ebp
f0109322:	c3                   	ret    

f0109323 <_ZL16cga_savebuf_copyib>:
#if CRT_SAVEROWS > 0
// Copy one screen's worth of data to or from the save buffer,
// starting at line 'first_line'.
static void
cga_savebuf_copy(int first_line, bool to_screen)
{
f0109323:	55                   	push   %ebp
f0109324:	89 e5                	mov    %esp,%ebp
f0109326:	83 ec 38             	sub    $0x38,%esp
f0109329:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010932c:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010932f:	89 7d fc             	mov    %edi,-0x4(%ebp)
f0109332:	88 55 e7             	mov    %dl,-0x19(%ebp)
	// Calculate the beginning & end of the save buffer area.
	uint16_t *pos = crtsave_buf + (first_line % CRT_SAVEROWS) * CRT_COLS;
f0109335:	89 c2                	mov    %eax,%edx
f0109337:	c1 fa 1f             	sar    $0x1f,%edx
f010933a:	c1 ea 19             	shr    $0x19,%edx
f010933d:	01 d0                	add    %edx,%eax
f010933f:	83 e0 7f             	and    $0x7f,%eax
f0109342:	29 d0                	sub    %edx,%eax
f0109344:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
f0109347:	c1 e3 05             	shl    $0x5,%ebx
f010934a:	81 c3 20 91 11 f0    	add    $0xf0119120,%ebx
	uint16_t *end = pos + CRT_ROWS * CRT_COLS;
f0109350:	8d bb a0 0f 00 00    	lea    0xfa0(%ebx),%edi
	// Check for wraparound.
	uint16_t *trueend = min(end, crtsave_buf + CRT_SAVEROWS * CRT_COLS);
f0109356:	c7 44 24 04 20 e1 11 	movl   $0xf011e120,0x4(%esp)
f010935d:	f0 
f010935e:	89 3c 24             	mov    %edi,(%esp)
f0109361:	e8 f1 04 00 00       	call   f0109857 <_Z3minIPtET_S1_S1_>
f0109366:	89 c6                	mov    %eax,%esi

	// Copy the initial portion.
	if (to_screen)
f0109368:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
f010936c:	74 1c                	je     f010938a <_ZL16cga_savebuf_copyib+0x67>
		memcpy(crt_buf, pos, (trueend - pos) * sizeof(uint16_t));
f010936e:	29 d8                	sub    %ebx,%eax
f0109370:	83 e0 fe             	and    $0xfffffffe,%eax
f0109373:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109377:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010937b:	a1 08 91 11 f0       	mov    0xf0119108,%eax
f0109380:	89 04 24             	mov    %eax,(%esp)
f0109383:	e8 cb 35 00 00       	call   f010c953 <_Z6memcpyPvPKvj>
f0109388:	eb 1a                	jmp    f01093a4 <_ZL16cga_savebuf_copyib+0x81>
	else
		memcpy(pos, crt_buf, (trueend - pos) * sizeof(uint16_t));
f010938a:	29 d8                	sub    %ebx,%eax
f010938c:	83 e0 fe             	and    $0xfffffffe,%eax
f010938f:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109393:	a1 08 91 11 f0       	mov    0xf0119108,%eax
f0109398:	89 44 24 04          	mov    %eax,0x4(%esp)
f010939c:	89 1c 24             	mov    %ebx,(%esp)
f010939f:	e8 af 35 00 00       	call   f010c953 <_Z6memcpyPvPKvj>

	// If there was wraparound, copy the second part of the screen.
	if (end == trueend)
f01093a4:	39 f7                	cmp    %esi,%edi
f01093a6:	74 54                	je     f01093fc <_ZL16cga_savebuf_copyib+0xd9>
		/* do nothing */;
	else if (to_screen)
f01093a8:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
f01093ac:	74 28                	je     f01093d6 <_ZL16cga_savebuf_copyib+0xb3>
		memcpy(crt_buf + (trueend - pos), crtsave_buf, (end - trueend) * sizeof(uint16_t));
f01093ae:	29 f7                	sub    %esi,%edi
f01093b0:	83 e7 fe             	and    $0xfffffffe,%edi
f01093b3:	89 7c 24 08          	mov    %edi,0x8(%esp)
f01093b7:	c7 44 24 04 20 91 11 	movl   $0xf0119120,0x4(%esp)
f01093be:	f0 
f01093bf:	29 de                	sub    %ebx,%esi
f01093c1:	89 f3                	mov    %esi,%ebx
f01093c3:	83 e3 fe             	and    $0xfffffffe,%ebx
f01093c6:	03 1d 08 91 11 f0    	add    0xf0119108,%ebx
f01093cc:	89 1c 24             	mov    %ebx,(%esp)
f01093cf:	e8 7f 35 00 00       	call   f010c953 <_Z6memcpyPvPKvj>
f01093d4:	eb 26                	jmp    f01093fc <_ZL16cga_savebuf_copyib+0xd9>
	else
		memcpy(crtsave_buf, crt_buf + (trueend - pos), (end - trueend) * sizeof(uint16_t));
f01093d6:	29 f7                	sub    %esi,%edi
f01093d8:	83 e7 fe             	and    $0xfffffffe,%edi
f01093db:	89 7c 24 08          	mov    %edi,0x8(%esp)
f01093df:	29 de                	sub    %ebx,%esi
f01093e1:	89 f3                	mov    %esi,%ebx
f01093e3:	83 e3 fe             	and    $0xfffffffe,%ebx
f01093e6:	03 1d 08 91 11 f0    	add    0xf0119108,%ebx
f01093ec:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f01093f0:	c7 04 24 20 91 11 f0 	movl   $0xf0119120,(%esp)
f01093f7:	e8 57 35 00 00       	call   f010c953 <_Z6memcpyPvPKvj>
}
f01093fc:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f01093ff:	8b 75 f8             	mov    -0x8(%ebp),%esi
f0109402:	8b 7d fc             	mov    -0x4(%ebp),%edi
f0109405:	89 ec                	mov    %ebp,%esp
f0109407:	5d                   	pop    %ebp
f0109408:	c3                   	ret    

f0109409 <_ZL13kbd_proc_datav>:
 * Get data from the keyboard.  If we finish a character, return it.  Else 0.
 * Return -1 if no data.
 */
static int
kbd_proc_data(void)
{
f0109409:	55                   	push   %ebp
f010940a:	89 e5                	mov    %esp,%ebp
f010940c:	83 ec 38             	sub    $0x38,%esp
f010940f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f0109412:	89 75 f8             	mov    %esi,-0x8(%ebp)
f0109415:	89 7d fc             	mov    %edi,-0x4(%ebp)
f0109418:	ba 64 00 00 00       	mov    $0x64,%edx
f010941d:	ec                   	in     (%dx),%al
	int c;
	uint8_t data;
	static uint32_t shift;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
f010941e:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
f0109423:	a8 01                	test   $0x1,%al
f0109425:	0f 84 93 01 00 00    	je     f01095be <_ZL13kbd_proc_datav+0x1b5>
f010942b:	b2 60                	mov    $0x60,%dl
f010942d:	ec                   	in     (%dx),%al
		return -1;

	data = inb(KBDATAP);

	if (data == 0xE0) {
f010942e:	3c e0                	cmp    $0xe0,%al
f0109430:	75 11                	jne    f0109443 <_ZL13kbd_proc_datav+0x3a>
		// E0 escape character
		shift |= E0ESC;
f0109432:	83 0d 28 e3 11 f0 40 	orl    $0x40,0xf011e328
f0109439:	bb 00 00 00 00       	mov    $0x0,%ebx
		return 0;
f010943e:	e9 7b 01 00 00       	jmp    f01095be <_ZL13kbd_proc_datav+0x1b5>
	} else if (data & 0x80) {
f0109443:	84 c0                	test   %al,%al
f0109445:	79 32                	jns    f0109479 <_ZL13kbd_proc_datav+0x70>
		// Key released
		data = (shift & E0ESC ? data : data & 0x7F);
f0109447:	8b 15 28 e3 11 f0    	mov    0xf011e328,%edx
f010944d:	f6 c2 40             	test   $0x40,%dl
f0109450:	75 03                	jne    f0109455 <_ZL13kbd_proc_datav+0x4c>
f0109452:	83 e0 7f             	and    $0x7f,%eax
		shift &= ~(shiftcode[data] | E0ESC);
f0109455:	0f b6 c0             	movzbl %al,%eax
f0109458:	0f b6 80 a0 ce 10 f0 	movzbl -0xfef3160(%eax),%eax
f010945f:	83 c8 40             	or     $0x40,%eax
f0109462:	0f b6 c0             	movzbl %al,%eax
f0109465:	f7 d0                	not    %eax
f0109467:	21 c2                	and    %eax,%edx
f0109469:	89 15 28 e3 11 f0    	mov    %edx,0xf011e328
f010946f:	bb 00 00 00 00       	mov    $0x0,%ebx
		return 0;
f0109474:	e9 45 01 00 00       	jmp    f01095be <_ZL13kbd_proc_datav+0x1b5>
	} else if (shift & E0ESC) {
f0109479:	8b 15 28 e3 11 f0    	mov    0xf011e328,%edx
f010947f:	f6 c2 40             	test   $0x40,%dl
f0109482:	74 0c                	je     f0109490 <_ZL13kbd_proc_datav+0x87>
		// Last character was an E0 escape; or with 0x80
		data |= 0x80;
f0109484:	83 c8 80             	or     $0xffffff80,%eax
		shift &= ~E0ESC;
f0109487:	83 e2 bf             	and    $0xffffffbf,%edx
f010948a:	89 15 28 e3 11 f0    	mov    %edx,0xf011e328
	}

	shift |= shiftcode[data];
f0109490:	0f b6 c0             	movzbl %al,%eax
	shift ^= togglecode[data];
f0109493:	0f b6 90 a0 ce 10 f0 	movzbl -0xfef3160(%eax),%edx
f010949a:	0b 15 28 e3 11 f0    	or     0xf011e328,%edx
f01094a0:	0f b6 88 a0 cf 10 f0 	movzbl -0xfef3060(%eax),%ecx
f01094a7:	31 ca                	xor    %ecx,%edx
f01094a9:	89 15 28 e3 11 f0    	mov    %edx,0xf011e328

	c = charcode[shift & (CTL | SHIFT)][data];
f01094af:	89 d1                	mov    %edx,%ecx
f01094b1:	83 e1 03             	and    $0x3,%ecx
f01094b4:	8b 1c 8d a0 d0 10 f0 	mov    -0xfef2f60(,%ecx,4),%ebx
f01094bb:	0f b6 1c 03          	movzbl (%ebx,%eax,1),%ebx
	if (shift & CAPSLOCK) {
f01094bf:	f6 c2 08             	test   $0x8,%dl
f01094c2:	74 1a                	je     f01094de <_ZL13kbd_proc_datav+0xd5>
		if ('a' <= c && c <= 'z')
f01094c4:	89 de                	mov    %ebx,%esi
f01094c6:	8d 43 9f             	lea    -0x61(%ebx),%eax
f01094c9:	83 f8 19             	cmp    $0x19,%eax
f01094cc:	77 05                	ja     f01094d3 <_ZL13kbd_proc_datav+0xca>
			c += 'A' - 'a';
f01094ce:	83 eb 20             	sub    $0x20,%ebx
f01094d1:	eb 0b                	jmp    f01094de <_ZL13kbd_proc_datav+0xd5>
		else if ('A' <= c && c <= 'Z')
f01094d3:	83 ee 41             	sub    $0x41,%esi
f01094d6:	83 fe 19             	cmp    $0x19,%esi
f01094d9:	77 03                	ja     f01094de <_ZL13kbd_proc_datav+0xd5>
			c += 'a' - 'A';
f01094db:	83 c3 20             	add    $0x20,%ebx
	}

	// Process special keys
#if CRT_SAVEROWS > 0
	// Shift-PageUp and Shift-PageDown: scroll console
	if ((shift & (CTL | SHIFT)) && (c == KEY_PGUP || c == KEY_PGDN)) {
f01094de:	85 c9                	test   %ecx,%ecx
f01094e0:	0f 84 b2 00 00 00    	je     f0109598 <_ZL13kbd_proc_datav+0x18f>
f01094e6:	8d 83 1a ff ff ff    	lea    -0xe6(%ebx),%eax
f01094ec:	83 f8 01             	cmp    $0x1,%eax
f01094ef:	0f 87 a3 00 00 00    	ja     f0109598 <_ZL13kbd_proc_datav+0x18f>
		cga_scroll(c == KEY_PGUP ? -CRT_ROWS : CRT_ROWS);
f01094f5:	81 fb e6 00 00 00    	cmp    $0xe6,%ebx
f01094fb:	0f 95 c0             	setne  %al
f01094fe:	0f b6 c0             	movzbl %al,%eax
f0109501:	83 e8 01             	sub    $0x1,%eax
f0109504:	83 e0 ce             	and    $0xffffffce,%eax
f0109507:	83 c0 19             	add    $0x19,%eax

#if CRT_SAVEROWS > 0
static void
cga_scroll(int delta)
{
	int new_backscroll = max(min(crtsave_backscroll - delta, (int) crtsave_size), 0);
f010950a:	0f bf 15 12 91 11 f0 	movswl 0xf0119112,%edx
f0109511:	89 55 e0             	mov    %edx,-0x20(%ebp)
f0109514:	0f b7 3d 0e 91 11 f0 	movzwl 0xf011910e,%edi
f010951b:	0f bf d7             	movswl %di,%edx
f010951e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f0109521:	8b 55 e0             	mov    -0x20(%ebp),%edx
f0109524:	89 54 24 04          	mov    %edx,0x4(%esp)
f0109528:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010952b:	29 c2                	sub    %eax,%edx
f010952d:	89 14 24             	mov    %edx,(%esp)
f0109530:	e8 33 03 00 00       	call   f0109868 <_Z3minIiET_S0_S0_>
f0109535:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010953c:	00 
f010953d:	89 04 24             	mov    %eax,(%esp)
f0109540:	e8 34 03 00 00       	call   f0109879 <_Z3maxIiET_S0_S0_>
f0109545:	89 c6                	mov    %eax,%esi

	if (new_backscroll == crtsave_backscroll)
f0109547:	bb 00 00 00 00       	mov    $0x0,%ebx
f010954c:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
f010954f:	74 6d                	je     f01095be <_ZL13kbd_proc_datav+0x1b5>
		return;
	if (crtsave_backscroll == 0)
f0109551:	66 85 ff             	test   %di,%di
f0109554:	75 14                	jne    f010956a <_ZL13kbd_proc_datav+0x161>
		// save current screen
		cga_savebuf_copy(crtsave_pos + crtsave_size, 0);
f0109556:	0f b7 05 10 91 11 f0 	movzwl 0xf0119110,%eax
f010955d:	03 45 e0             	add    -0x20(%ebp),%eax
f0109560:	ba 00 00 00 00       	mov    $0x0,%edx
f0109565:	e8 b9 fd ff ff       	call   f0109323 <_ZL16cga_savebuf_copyib>
	
	crtsave_backscroll = new_backscroll;
f010956a:	66 89 35 0e 91 11 f0 	mov    %si,0xf011910e
	cga_savebuf_copy(crtsave_pos + crtsave_size - crtsave_backscroll, 1);
f0109571:	0f bf 15 12 91 11 f0 	movswl 0xf0119112,%edx
f0109578:	0f b7 05 10 91 11 f0 	movzwl 0xf0119110,%eax
f010957f:	8d 04 02             	lea    (%edx,%eax,1),%eax
f0109582:	0f bf f6             	movswl %si,%esi
f0109585:	29 f0                	sub    %esi,%eax
f0109587:	ba 01 00 00 00       	mov    $0x1,%edx
f010958c:	e8 92 fd ff ff       	call   f0109323 <_ZL16cga_savebuf_copyib>
f0109591:	bb 00 00 00 00       	mov    $0x0,%ebx
f0109596:	eb 26                	jmp    f01095be <_ZL13kbd_proc_datav+0x1b5>
		cga_scroll(c == KEY_PGUP ? -CRT_ROWS : CRT_ROWS);
		return 0;
	}
#endif
	// Ctrl-Alt-Del: reboot
	if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
f0109598:	f7 d2                	not    %edx
f010959a:	f6 c2 06             	test   $0x6,%dl
f010959d:	75 1f                	jne    f01095be <_ZL13kbd_proc_datav+0x1b5>
f010959f:	81 fb e9 00 00 00    	cmp    $0xe9,%ebx
f01095a5:	75 17                	jne    f01095be <_ZL13kbd_proc_datav+0x1b5>
		cprintf("Rebooting!\n");
f01095a7:	c7 04 24 81 ce 10 f0 	movl   $0xf010ce81,(%esp)
f01095ae:	e8 c4 24 00 00       	call   f010ba77 <_Z7cprintfPKcz>
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f01095b3:	ba 92 00 00 00       	mov    $0x92,%edx
f01095b8:	b8 03 00 00 00       	mov    $0x3,%eax
f01095bd:	ee                   	out    %al,(%dx)
		outb(0x92, 0x3); // courtesy of Chris Frost
	}

	return c;
}
f01095be:	89 d8                	mov    %ebx,%eax
f01095c0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f01095c3:	8b 75 f8             	mov    -0x8(%ebp),%esi
f01095c6:	8b 7d fc             	mov    -0x4(%ebp),%edi
f01095c9:	89 ec                	mov    %ebp,%esp
f01095cb:	5d                   	pop    %ebp
f01095cc:	c3                   	ret    

f01095cd <_ZL8cga_putci>:

#endif

static void
cga_putc(int c)
{
f01095cd:	55                   	push   %ebp
f01095ce:	89 e5                	mov    %esp,%ebp
f01095d0:	56                   	push   %esi
f01095d1:	53                   	push   %ebx
f01095d2:	83 ec 10             	sub    $0x10,%esp
f01095d5:	89 c3                	mov    %eax,%ebx
#if CRT_SAVEROWS > 0
	// unscroll if necessary
	if (crtsave_backscroll > 0) {
f01095d7:	66 83 3d 0e 91 11 f0 	cmpw   $0x0,0xf011910e
f01095de:	00 
f01095df:	7e 24                	jle    f0109605 <_ZL8cga_putci+0x38>
		cga_savebuf_copy(crtsave_pos + crtsave_size, 1);
f01095e1:	0f bf 15 12 91 11 f0 	movswl 0xf0119112,%edx
f01095e8:	0f b7 05 10 91 11 f0 	movzwl 0xf0119110,%eax
f01095ef:	8d 04 02             	lea    (%edx,%eax,1),%eax
f01095f2:	ba 01 00 00 00       	mov    $0x1,%edx
f01095f7:	e8 27 fd ff ff       	call   f0109323 <_ZL16cga_savebuf_copyib>
		crtsave_backscroll = 0;
f01095fc:	66 c7 05 0e 91 11 f0 	movw   $0x0,0xf011910e
f0109603:	00 00 
	}
	
#endif
	// if no attribute given, then use light gray on black
	if (!(c & ~0xFF))
f0109605:	f7 c3 00 ff ff ff    	test   $0xffffff00,%ebx
f010960b:	75 03                	jne    f0109610 <_ZL8cga_putci+0x43>
		c |= 0x0700;
f010960d:	80 cf 07             	or     $0x7,%bh

	switch (c & 0xff) {
f0109610:	0f b6 c3             	movzbl %bl,%eax
f0109613:	83 f8 09             	cmp    $0x9,%eax
f0109616:	0f 84 85 00 00 00    	je     f01096a1 <_ZL8cga_putci+0xd4>
f010961c:	83 f8 09             	cmp    $0x9,%eax
f010961f:	7f 11                	jg     f0109632 <_ZL8cga_putci+0x65>
f0109621:	83 f8 08             	cmp    $0x8,%eax
f0109624:	0f 85 ab 00 00 00    	jne    f01096d5 <_ZL8cga_putci+0x108>
f010962a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f0109630:	eb 18                	jmp    f010964a <_ZL8cga_putci+0x7d>
f0109632:	83 f8 0a             	cmp    $0xa,%eax
f0109635:	8d 76 00             	lea    0x0(%esi),%esi
f0109638:	74 3d                	je     f0109677 <_ZL8cga_putci+0xaa>
f010963a:	83 f8 0d             	cmp    $0xd,%eax
f010963d:	8d 76 00             	lea    0x0(%esi),%esi
f0109640:	0f 85 8f 00 00 00    	jne    f01096d5 <_ZL8cga_putci+0x108>
f0109646:	66 90                	xchg   %ax,%ax
f0109648:	eb 35                	jmp    f010967f <_ZL8cga_putci+0xb2>
	case '\b':
		if (crt_pos > 0) {
f010964a:	0f b7 05 0c 91 11 f0 	movzwl 0xf011910c,%eax
f0109651:	66 85 c0             	test   %ax,%ax
f0109654:	0f 84 5a 01 00 00    	je     f01097b4 <_ZL8cga_putci+0x1e7>
			crt_pos--;
f010965a:	83 e8 01             	sub    $0x1,%eax
f010965d:	66 a3 0c 91 11 f0    	mov    %ax,0xf011910c
			crt_buf[crt_pos] = (c & ~0xff) | ' ';
f0109663:	0f b7 c0             	movzwl %ax,%eax
f0109666:	b3 00                	mov    $0x0,%bl
f0109668:	83 cb 20             	or     $0x20,%ebx
f010966b:	8b 15 08 91 11 f0    	mov    0xf0119108,%edx
f0109671:	66 89 1c 42          	mov    %bx,(%edx,%eax,2)
f0109675:	eb 7b                	jmp    f01096f2 <_ZL8cga_putci+0x125>
		}
		break;
	case '\n':
		crt_pos += CRT_COLS;
f0109677:	66 83 05 0c 91 11 f0 	addw   $0x50,0xf011910c
f010967e:	50 
		/* fallthru */
	case '\r':
		crt_pos -= (crt_pos % CRT_COLS);
f010967f:	0f b7 05 0c 91 11 f0 	movzwl 0xf011910c,%eax
f0109686:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
f010968c:	c1 e8 10             	shr    $0x10,%eax
f010968f:	66 c1 e8 06          	shr    $0x6,%ax
f0109693:	8d 04 80             	lea    (%eax,%eax,4),%eax
f0109696:	c1 e0 04             	shl    $0x4,%eax
f0109699:	66 a3 0c 91 11 f0    	mov    %ax,0xf011910c
		break;
f010969f:	eb 51                	jmp    f01096f2 <_ZL8cga_putci+0x125>
	case '\t':
		cga_putc(' ');
f01096a1:	b8 20 00 00 00       	mov    $0x20,%eax
f01096a6:	e8 22 ff ff ff       	call   f01095cd <_ZL8cga_putci>
		cga_putc(' ');
f01096ab:	b8 20 00 00 00       	mov    $0x20,%eax
f01096b0:	e8 18 ff ff ff       	call   f01095cd <_ZL8cga_putci>
		cga_putc(' ');
f01096b5:	b8 20 00 00 00       	mov    $0x20,%eax
f01096ba:	e8 0e ff ff ff       	call   f01095cd <_ZL8cga_putci>
		cga_putc(' ');
f01096bf:	b8 20 00 00 00       	mov    $0x20,%eax
f01096c4:	e8 04 ff ff ff       	call   f01095cd <_ZL8cga_putci>
		cga_putc(' ');
f01096c9:	b8 20 00 00 00       	mov    $0x20,%eax
f01096ce:	e8 fa fe ff ff       	call   f01095cd <_ZL8cga_putci>
		break;
f01096d3:	eb 1d                	jmp    f01096f2 <_ZL8cga_putci+0x125>
	default:
		crt_buf[crt_pos++] = c;		/* write the character */
f01096d5:	0f b7 05 0c 91 11 f0 	movzwl 0xf011910c,%eax
f01096dc:	0f b7 c8             	movzwl %ax,%ecx
f01096df:	8b 15 08 91 11 f0    	mov    0xf0119108,%edx
f01096e5:	66 89 1c 4a          	mov    %bx,(%edx,%ecx,2)
f01096e9:	83 c0 01             	add    $0x1,%eax
f01096ec:	66 a3 0c 91 11 f0    	mov    %ax,0xf011910c
		break;
	}

	// What is the purpose of this?
	if (crt_pos >= CRT_SIZE) {
f01096f2:	66 81 3d 0c 91 11 f0 	cmpw   $0x7cf,0xf011910c
f01096f9:	cf 07 
f01096fb:	0f 86 b3 00 00 00    	jbe    f01097b4 <_ZL8cga_putci+0x1e7>
		int i;
		
#if CRT_SAVEROWS > 0
		// Save the scrolled-back row
		if (crtsave_size == CRT_SAVEROWS - CRT_ROWS)
f0109701:	0f b7 05 12 91 11 f0 	movzwl 0xf0119112,%eax
f0109708:	66 83 f8 67          	cmp    $0x67,%ax
f010970c:	75 15                	jne    f0109723 <_ZL8cga_putci+0x156>
			crtsave_pos = (crtsave_pos + 1) % CRT_SAVEROWS;
f010970e:	0f b7 05 10 91 11 f0 	movzwl 0xf0119110,%eax
f0109715:	83 c0 01             	add    $0x1,%eax
f0109718:	83 e0 7f             	and    $0x7f,%eax
f010971b:	66 a3 10 91 11 f0    	mov    %ax,0xf0119110
f0109721:	eb 09                	jmp    f010972c <_ZL8cga_putci+0x15f>
		else
			crtsave_size++;
f0109723:	83 c0 01             	add    $0x1,%eax
f0109726:	66 a3 12 91 11 f0    	mov    %ax,0xf0119112
		memcpy(crtsave_buf + ((crtsave_pos + crtsave_size - 1) % CRT_SAVEROWS) * CRT_COLS, crt_buf, CRT_COLS * sizeof(uint16_t));
f010972c:	c7 44 24 08 a0 00 00 	movl   $0xa0,0x8(%esp)
f0109733:	00 
f0109734:	a1 08 91 11 f0       	mov    0xf0119108,%eax
f0109739:	89 44 24 04          	mov    %eax,0x4(%esp)
f010973d:	0f b7 15 10 91 11 f0 	movzwl 0xf0119110,%edx
f0109744:	0f bf 05 12 91 11 f0 	movswl 0xf0119112,%eax
f010974b:	8d 4c 02 ff          	lea    -0x1(%edx,%eax,1),%ecx
f010974f:	89 ca                	mov    %ecx,%edx
f0109751:	c1 fa 1f             	sar    $0x1f,%edx
f0109754:	c1 ea 19             	shr    $0x19,%edx
f0109757:	8d 04 11             	lea    (%ecx,%edx,1),%eax
f010975a:	83 e0 7f             	and    $0x7f,%eax
f010975d:	29 d0                	sub    %edx,%eax
f010975f:	8d 04 80             	lea    (%eax,%eax,4),%eax
f0109762:	c1 e0 05             	shl    $0x5,%eax
f0109765:	05 20 91 11 f0       	add    $0xf0119120,%eax
f010976a:	89 04 24             	mov    %eax,(%esp)
f010976d:	e8 e1 31 00 00       	call   f010c953 <_Z6memcpyPvPKvj>
		
#endif
		memcpy(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
f0109772:	a1 08 91 11 f0       	mov    0xf0119108,%eax
f0109777:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
f010977e:	00 
f010977f:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
f0109785:	89 54 24 04          	mov    %edx,0x4(%esp)
f0109789:	89 04 24             	mov    %eax,(%esp)
f010978c:	e8 c2 31 00 00       	call   f010c953 <_Z6memcpyPvPKvj>
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
			crt_buf[i] = 0x0700 | ' ';
f0109791:	8b 15 08 91 11 f0    	mov    0xf0119108,%edx
f0109797:	b8 80 07 00 00       	mov    $0x780,%eax
f010979c:	66 c7 04 42 20 07    	movw   $0x720,(%edx,%eax,2)
			crtsave_size++;
		memcpy(crtsave_buf + ((crtsave_pos + crtsave_size - 1) % CRT_SAVEROWS) * CRT_COLS, crt_buf, CRT_COLS * sizeof(uint16_t));
		
#endif
		memcpy(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
f01097a2:	83 c0 01             	add    $0x1,%eax
f01097a5:	3d d0 07 00 00       	cmp    $0x7d0,%eax
f01097aa:	75 f0                	jne    f010979c <_ZL8cga_putci+0x1cf>
			crt_buf[i] = 0x0700 | ' ';
		crt_pos -= CRT_COLS;
f01097ac:	66 83 2d 0c 91 11 f0 	subw   $0x50,0xf011910c
f01097b3:	50 
	}

	/* move that little blinky thing */
	outb(addr_6845, 14);
f01097b4:	8b 0d 04 91 11 f0    	mov    0xf0119104,%ecx
f01097ba:	89 cb                	mov    %ecx,%ebx
f01097bc:	b8 0e 00 00 00       	mov    $0xe,%eax
f01097c1:	89 ca                	mov    %ecx,%edx
f01097c3:	ee                   	out    %al,(%dx)
	outb(addr_6845 + 1, crt_pos >> 8);
f01097c4:	0f b7 35 0c 91 11 f0 	movzwl 0xf011910c,%esi
f01097cb:	83 c1 01             	add    $0x1,%ecx
f01097ce:	89 f2                	mov    %esi,%edx
f01097d0:	0f b6 c6             	movzbl %dh,%eax
f01097d3:	89 ca                	mov    %ecx,%edx
f01097d5:	ee                   	out    %al,(%dx)
f01097d6:	b8 0f 00 00 00       	mov    $0xf,%eax
f01097db:	89 da                	mov    %ebx,%edx
f01097dd:	ee                   	out    %al,(%dx)
f01097de:	89 f0                	mov    %esi,%eax
f01097e0:	89 ca                	mov    %ecx,%edx
f01097e2:	ee                   	out    %al,(%dx)
	outb(addr_6845, 15);
	outb(addr_6845 + 1, crt_pos);
}
f01097e3:	83 c4 10             	add    $0x10,%esp
f01097e6:	5b                   	pop    %ebx
f01097e7:	5e                   	pop    %esi
f01097e8:	5d                   	pop    %ebp
f01097e9:	c3                   	ret    

f01097ea <_Z9cons_putci>:
}

// output a character to the console
void
cons_putc(int c)
{
f01097ea:	55                   	push   %ebp
f01097eb:	89 e5                	mov    %esp,%ebp
f01097ed:	57                   	push   %edi
f01097ee:	56                   	push   %esi
f01097ef:	53                   	push   %ebx
f01097f0:	83 ec 0c             	sub    $0xc,%esp
f01097f3:	8b 5d 08             	mov    0x8(%ebp),%ebx
f01097f6:	be 00 00 00 00       	mov    $0x0,%esi

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f01097fb:	bf 79 03 00 00       	mov    $0x379,%edi
f0109800:	b9 84 00 00 00       	mov    $0x84,%ecx
f0109805:	89 fa                	mov    %edi,%edx
f0109807:	ec                   	in     (%dx),%al
static void
lpt_putc(int c)
{
	int i;

	for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
f0109808:	84 c0                	test   %al,%al
f010980a:	78 13                	js     f010981f <_Z9cons_putci+0x35>
f010980c:	81 fe 00 32 00 00    	cmp    $0x3200,%esi
f0109812:	74 0b                	je     f010981f <_Z9cons_putci+0x35>
f0109814:	89 ca                	mov    %ecx,%edx
f0109816:	ec                   	in     (%dx),%al
f0109817:	ec                   	in     (%dx),%al
f0109818:	ec                   	in     (%dx),%al
f0109819:	ec                   	in     (%dx),%al
f010981a:	83 c6 01             	add    $0x1,%esi
f010981d:	eb e6                	jmp    f0109805 <_Z9cons_putci+0x1b>
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f010981f:	ba 78 03 00 00       	mov    $0x378,%edx
f0109824:	89 d8                	mov    %ebx,%eax
f0109826:	ee                   	out    %al,(%dx)
f0109827:	b2 7a                	mov    $0x7a,%dl
f0109829:	b8 0d 00 00 00       	mov    $0xd,%eax
f010982e:	ee                   	out    %al,(%dx)
f010982f:	b8 08 00 00 00       	mov    $0x8,%eax
f0109834:	ee                   	out    %al,(%dx)
// output a character to the console
void
cons_putc(int c)
{
	lpt_putc(c);
	cga_putc(c);
f0109835:	89 d8                	mov    %ebx,%eax
f0109837:	e8 91 fd ff ff       	call   f01095cd <_ZL8cga_putci>
}
f010983c:	83 c4 0c             	add    $0xc,%esp
f010983f:	5b                   	pop    %ebx
f0109840:	5e                   	pop    %esi
f0109841:	5f                   	pop    %edi
f0109842:	5d                   	pop    %ebp
f0109843:	c3                   	ret    

f0109844 <_Z8cputchari>:
f0109844:	55                   	push   %ebp
f0109845:	89 e5                	mov    %esp,%ebp
f0109847:	83 ec 18             	sub    $0x18,%esp
f010984a:	8b 45 08             	mov    0x8(%ebp),%eax
f010984d:	89 04 24             	mov    %eax,(%esp)
f0109850:	e8 95 ff ff ff       	call   f01097ea <_Z9cons_putci>
f0109855:	c9                   	leave  
f0109856:	c3                   	ret    

f0109857 <_Z3minIPtET_S1_S1_>:
typedef int32_t off_t;


// min and max operations
template <typename T>
T min(T a, T b) {
f0109857:	55                   	push   %ebp
f0109858:	89 e5                	mov    %esp,%ebp
f010985a:	8b 55 08             	mov    0x8(%ebp),%edx
f010985d:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109860:	39 c2                	cmp    %eax,%edx
f0109862:	73 02                	jae    f0109866 <_Z3minIPtET_S1_S1_+0xf>
f0109864:	89 d0                	mov    %edx,%eax
	return a <= b ? a : b;
}
f0109866:	5d                   	pop    %ebp
f0109867:	c3                   	ret    

f0109868 <_Z3minIiET_S0_S0_>:
typedef int32_t off_t;


// min and max operations
template <typename T>
T min(T a, T b) {
f0109868:	55                   	push   %ebp
f0109869:	89 e5                	mov    %esp,%ebp
f010986b:	8b 55 08             	mov    0x8(%ebp),%edx
f010986e:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109871:	39 d0                	cmp    %edx,%eax
f0109873:	7e 02                	jle    f0109877 <_Z3minIiET_S0_S0_+0xf>
f0109875:	89 d0                	mov    %edx,%eax
	return a <= b ? a : b;
}
f0109877:	5d                   	pop    %ebp
f0109878:	c3                   	ret    

f0109879 <_Z3maxIiET_S0_S0_>:

template <typename T>
T max(T a, T b) {
f0109879:	55                   	push   %ebp
f010987a:	89 e5                	mov    %esp,%ebp
f010987c:	8b 55 08             	mov    0x8(%ebp),%edx
f010987f:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109882:	39 d0                	cmp    %edx,%eax
f0109884:	7d 02                	jge    f0109888 <_Z3maxIiET_S0_S0_+0xf>
f0109886:	89 d0                	mov    %edx,%eax
	return a >= b ? a : b;
}
f0109888:	5d                   	pop    %ebp
f0109889:	c3                   	ret    
f010988a:	00 00                	add    %al,(%eax)
f010988c:	00 00                	add    %al,(%eax)
	...

f0109890 <_Z12mon_kerninfoiPPcP9Trapframe>:
	return 0;
}

int
mon_kerninfo(int argc, char **argv, struct Trapframe *tf)
{
f0109890:	55                   	push   %ebp
f0109891:	89 e5                	mov    %esp,%ebp
f0109893:	83 ec 18             	sub    $0x18,%esp
	extern char _start[], etext[], edata[], end[];

	cprintf("Special kernel symbols:\n");
f0109896:	c7 04 24 c0 d3 10 f0 	movl   $0xf010d3c0,(%esp)
f010989d:	e8 d5 21 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  _start %08x (virt)  %08x (phys)\n", _start, _start - KERNBASE);
f01098a2:	c7 44 24 08 0c 00 10 	movl   $0x10000c,0x8(%esp)
f01098a9:	00 
f01098aa:	c7 44 24 04 0c 00 10 	movl   $0xf010000c,0x4(%esp)
f01098b1:	f0 
f01098b2:	c7 04 24 08 d5 10 f0 	movl   $0xf010d508,(%esp)
f01098b9:	e8 b9 21 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  etext  %08x (virt)  %08x (phys)\n", etext, etext - KERNBASE);
f01098be:	c7 44 24 08 e8 cd 10 	movl   $0x10cde8,0x8(%esp)
f01098c5:	00 
f01098c6:	c7 44 24 04 e8 cd 10 	movl   $0xf010cde8,0x4(%esp)
f01098cd:	f0 
f01098ce:	c7 04 24 2c d5 10 f0 	movl   $0xf010d52c,(%esp)
f01098d5:	e8 9d 21 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  edata  %08x (virt)  %08x (phys)\n", edata, edata - KERNBASE);
f01098da:	c7 44 24 08 c4 90 11 	movl   $0x1190c4,0x8(%esp)
f01098e1:	00 
f01098e2:	c7 44 24 04 c4 90 11 	movl   $0xf01190c4,0x4(%esp)
f01098e9:	f0 
f01098ea:	c7 04 24 50 d5 10 f0 	movl   $0xf010d550,(%esp)
f01098f1:	e8 81 21 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  end    %08x (virt)  %08x (phys)\n", end, end - KERNBASE);
f01098f6:	c7 44 24 08 20 f0 11 	movl   $0x11f020,0x8(%esp)
f01098fd:	00 
f01098fe:	c7 44 24 04 20 f0 11 	movl   $0xf011f020,0x4(%esp)
f0109905:	f0 
f0109906:	c7 04 24 74 d5 10 f0 	movl   $0xf010d574,(%esp)
f010990d:	e8 65 21 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("Kernel executable memory footprint: %dKB\n",
		(end-_start+1023)/1024);
f0109912:	b8 1f f4 11 f0       	mov    $0xf011f41f,%eax
f0109917:	2d 0c 00 10 f0       	sub    $0xf010000c,%eax
f010991c:	89 c2                	mov    %eax,%edx
f010991e:	c1 fa 1f             	sar    $0x1f,%edx
f0109921:	c1 ea 16             	shr    $0x16,%edx
f0109924:	8d 04 02             	lea    (%edx,%eax,1),%eax
f0109927:	c1 f8 0a             	sar    $0xa,%eax
f010992a:	89 44 24 04          	mov    %eax,0x4(%esp)
f010992e:	c7 04 24 98 d5 10 f0 	movl   $0xf010d598,(%esp)
f0109935:	e8 3d 21 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	return 0;
}
f010993a:	b8 00 00 00 00       	mov    $0x0,%eax
f010993f:	c9                   	leave  
f0109940:	c3                   	ret    

f0109941 <_Z8mon_helpiPPcP9Trapframe>:

/***** Implementations of basic kernel monitor commands *****/

int
mon_help(int argc, char **argv, struct Trapframe *tf)
{
f0109941:	55                   	push   %ebp
f0109942:	89 e5                	mov    %esp,%ebp
f0109944:	57                   	push   %edi
f0109945:	56                   	push   %esi
f0109946:	53                   	push   %ebx
f0109947:	83 ec 1c             	sub    $0x1c,%esp
f010994a:	bb 00 00 00 00       	mov    $0x0,%ebx
	int i;

	for (i = 0; i < NCOMMANDS; i++)
		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
f010994f:	be 84 d6 10 f0       	mov    $0xf010d684,%esi
f0109954:	bf 80 d6 10 f0       	mov    $0xf010d680,%edi
f0109959:	8b 04 1e             	mov    (%esi,%ebx,1),%eax
f010995c:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109960:	8b 04 1f             	mov    (%edi,%ebx,1),%eax
f0109963:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109967:	c7 04 24 d9 d3 10 f0 	movl   $0xf010d3d9,(%esp)
f010996e:	e8 04 21 00 00       	call   f010ba77 <_Z7cprintfPKcz>
f0109973:	83 c3 0c             	add    $0xc,%ebx
int
mon_help(int argc, char **argv, struct Trapframe *tf)
{
	int i;

	for (i = 0; i < NCOMMANDS; i++)
f0109976:	83 fb 30             	cmp    $0x30,%ebx
f0109979:	75 de                	jne    f0109959 <_Z8mon_helpiPPcP9Trapframe+0x18>
		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
	return 0;
}
f010997b:	b8 00 00 00 00       	mov    $0x0,%eax
f0109980:	83 c4 1c             	add    $0x1c,%esp
f0109983:	5b                   	pop    %ebx
f0109984:	5e                   	pop    %esi
f0109985:	5f                   	pop    %edi
f0109986:	5d                   	pop    %ebp
f0109987:	c3                   	ret    

f0109988 <_Z7monitorP9Trapframe>:
	return 0;
}

void
monitor(struct Trapframe *tf)
{
f0109988:	55                   	push   %ebp
f0109989:	89 e5                	mov    %esp,%ebp
f010998b:	57                   	push   %edi
f010998c:	56                   	push   %esi
f010998d:	53                   	push   %ebx
f010998e:	83 ec 5c             	sub    $0x5c,%esp
	char *buf;

	// The 'make grade' script depends on the following printout, so don't
	// remove it.
	cprintf("Welcome to the JOS kernel monitor!\n");
f0109991:	c7 04 24 c4 d5 10 f0 	movl   $0xf010d5c4,(%esp)
f0109998:	e8 da 20 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("Type 'help' for a list of commands.\n");
f010999d:	c7 04 24 e8 d5 10 f0 	movl   $0xf010d5e8,(%esp)
f01099a4:	e8 ce 20 00 00       	call   f010ba77 <_Z7cprintfPKcz>

	if (tf != NULL)
f01099a9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
f01099ad:	74 0b                	je     f01099ba <_Z7monitorP9Trapframe+0x32>
		print_trapframe(tf);
f01099af:	8b 45 08             	mov    0x8(%ebp),%eax
f01099b2:	89 04 24             	mov    %eax,(%esp)
f01099b5:	e8 49 22 00 00       	call   f010bc03 <_Z15print_trapframeP9Trapframe>

	while (1) {
		buf = readline("K> ");
f01099ba:	c7 04 24 e2 d3 10 f0 	movl   $0xf010d3e2,(%esp)
f01099c1:	e8 1a 2d 00 00       	call   f010c6e0 <_Z8readlinePKc>
f01099c6:	89 c6                	mov    %eax,%esi
		if (buf != NULL)
f01099c8:	85 c0                	test   %eax,%eax
f01099ca:	74 ee                	je     f01099ba <_Z7monitorP9Trapframe+0x32>
	char *argv[MAXARGS];
	int i;

	// Parse the command buffer into whitespace-separated arguments
	argc = 0;
	argv[argc] = 0;
f01099cc:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
f01099d3:	bb 00 00 00 00       	mov    $0x0,%ebx
	while (1) {
		// gobble whitespace
		while (*buf && strchr(WHITESPACE, *buf))
f01099d8:	0f b6 06             	movzbl (%esi),%eax
f01099db:	84 c0                	test   %al,%al
f01099dd:	74 6d                	je     f0109a4c <_Z7monitorP9Trapframe+0xc4>
f01099df:	0f be c0             	movsbl %al,%eax
f01099e2:	89 44 24 04          	mov    %eax,0x4(%esp)
f01099e6:	c7 04 24 e6 d3 10 f0 	movl   $0xf010d3e6,(%esp)
f01099ed:	e8 e2 2e 00 00       	call   f010c8d4 <_Z6strchrPKcc>
f01099f2:	85 c0                	test   %eax,%eax
f01099f4:	0f 84 c7 00 00 00    	je     f0109ac1 <_Z7monitorP9Trapframe+0x139>
			*buf++ = 0;
f01099fa:	c6 06 00             	movb   $0x0,(%esi)
f01099fd:	83 c6 01             	add    $0x1,%esi
f0109a00:	eb d6                	jmp    f01099d8 <_Z7monitorP9Trapframe+0x50>
		if (*buf == 0)
			break;

		// save and scan past next arg
		if (argc == MAXARGS-1) {
f0109a02:	83 fb 0f             	cmp    $0xf,%ebx
f0109a05:	75 16                	jne    f0109a1d <_Z7monitorP9Trapframe+0x95>
			cprintf("Too many arguments (max %d)\n", MAXARGS);
f0109a07:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
f0109a0e:	00 
f0109a0f:	c7 04 24 eb d3 10 f0 	movl   $0xf010d3eb,(%esp)
f0109a16:	e8 5c 20 00 00       	call   f010ba77 <_Z7cprintfPKcz>
f0109a1b:	eb 9d                	jmp    f01099ba <_Z7monitorP9Trapframe+0x32>
			return 0;
		}
		argv[argc++] = buf;
f0109a1d:	89 74 9d a8          	mov    %esi,-0x58(%ebp,%ebx,4)
		while (*buf && !strchr(WHITESPACE, *buf))
f0109a21:	0f b6 06             	movzbl (%esi),%eax
f0109a24:	84 c0                	test   %al,%al
f0109a26:	0f 84 a9 00 00 00    	je     f0109ad5 <_Z7monitorP9Trapframe+0x14d>
f0109a2c:	0f be c0             	movsbl %al,%eax
f0109a2f:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109a33:	c7 04 24 e6 d3 10 f0 	movl   $0xf010d3e6,(%esp)
f0109a3a:	e8 95 2e 00 00       	call   f010c8d4 <_Z6strchrPKcc>
f0109a3f:	85 c0                	test   %eax,%eax
f0109a41:	0f 85 8e 00 00 00    	jne    f0109ad5 <_Z7monitorP9Trapframe+0x14d>
			buf++;
f0109a47:	83 c6 01             	add    $0x1,%esi
f0109a4a:	eb d5                	jmp    f0109a21 <_Z7monitorP9Trapframe+0x99>
	}
	argv[argc] = 0;
f0109a4c:	c7 44 9d a8 00 00 00 	movl   $0x0,-0x58(%ebp,%ebx,4)
f0109a53:	00 

	// Lookup and invoke the command
	if (argc == 0)
f0109a54:	85 db                	test   %ebx,%ebx
f0109a56:	0f 84 5e ff ff ff    	je     f01099ba <_Z7monitorP9Trapframe+0x32>
f0109a5c:	be 80 d6 10 f0       	mov    $0xf010d680,%esi
f0109a61:	bf 00 00 00 00       	mov    $0x0,%edi
		return 0;
	for (i = 0; i < NCOMMANDS; i++) {
		if (strcmp(argv[0], commands[i].name) == 0)
f0109a66:	8b 06                	mov    (%esi),%eax
f0109a68:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109a6c:	8b 45 a8             	mov    -0x58(%ebp),%eax
f0109a6f:	89 04 24             	mov    %eax,(%esp)
f0109a72:	e8 fe 2d 00 00       	call   f010c875 <_Z6strcmpPKcS0_>
f0109a77:	85 c0                	test   %eax,%eax
f0109a79:	75 23                	jne    f0109a9e <_Z7monitorP9Trapframe+0x116>
			return commands[i].func(argc, argv, tf);
f0109a7b:	6b ff 0c             	imul   $0xc,%edi,%edi
f0109a7e:	8b 45 08             	mov    0x8(%ebp),%eax
f0109a81:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109a85:	8d 45 a8             	lea    -0x58(%ebp),%eax
f0109a88:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109a8c:	89 1c 24             	mov    %ebx,(%esp)
f0109a8f:	ff 97 88 d6 10 f0    	call   *-0xfef2978(%edi)
		print_trapframe(tf);

	while (1) {
		buf = readline("K> ");
		if (buf != NULL)
			if (runcmd(buf, tf) < 0)
f0109a95:	85 c0                	test   %eax,%eax
f0109a97:	78 44                	js     f0109add <_Z7monitorP9Trapframe+0x155>
f0109a99:	e9 1c ff ff ff       	jmp    f01099ba <_Z7monitorP9Trapframe+0x32>
	argv[argc] = 0;

	// Lookup and invoke the command
	if (argc == 0)
		return 0;
	for (i = 0; i < NCOMMANDS; i++) {
f0109a9e:	83 c7 01             	add    $0x1,%edi
f0109aa1:	83 c6 0c             	add    $0xc,%esi
f0109aa4:	83 ff 04             	cmp    $0x4,%edi
f0109aa7:	75 bd                	jne    f0109a66 <_Z7monitorP9Trapframe+0xde>
		if (strcmp(argv[0], commands[i].name) == 0)
			return commands[i].func(argc, argv, tf);
	}
	cprintf("Unknown command '%s'\n", argv[0]);
f0109aa9:	8b 45 a8             	mov    -0x58(%ebp),%eax
f0109aac:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109ab0:	c7 04 24 08 d4 10 f0 	movl   $0xf010d408,(%esp)
f0109ab7:	e8 bb 1f 00 00       	call   f010ba77 <_Z7cprintfPKcz>
f0109abc:	e9 f9 fe ff ff       	jmp    f01099ba <_Z7monitorP9Trapframe+0x32>
	argv[argc] = 0;
	while (1) {
		// gobble whitespace
		while (*buf && strchr(WHITESPACE, *buf))
			*buf++ = 0;
		if (*buf == 0)
f0109ac1:	80 3e 00             	cmpb   $0x0,(%esi)
f0109ac4:	0f 85 38 ff ff ff    	jne    f0109a02 <_Z7monitorP9Trapframe+0x7a>
f0109aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f0109ad0:	e9 77 ff ff ff       	jmp    f0109a4c <_Z7monitorP9Trapframe+0xc4>
		// save and scan past next arg
		if (argc == MAXARGS-1) {
			cprintf("Too many arguments (max %d)\n", MAXARGS);
			return 0;
		}
		argv[argc++] = buf;
f0109ad5:	83 c3 01             	add    $0x1,%ebx
f0109ad8:	e9 fb fe ff ff       	jmp    f01099d8 <_Z7monitorP9Trapframe+0x50>
		buf = readline("K> ");
		if (buf != NULL)
			if (runcmd(buf, tf) < 0)
				break;
	}
}
f0109add:	83 c4 5c             	add    $0x5c,%esp
f0109ae0:	5b                   	pop    %ebx
f0109ae1:	5e                   	pop    %esi
f0109ae2:	5f                   	pop    %edi
f0109ae3:	5d                   	pop    %ebp
f0109ae4:	c3                   	ret    

f0109ae5 <_Z8mon_exitiPPcP9Trapframe>:
	//}
	return 0;
}
int
mon_exit(int argc, char **argv, struct Trapframe *tf)
{
f0109ae5:	55                   	push   %ebp
f0109ae6:	89 e5                	mov    %esp,%ebp
f0109ae8:	83 ec 18             	sub    $0x18,%esp
f0109aeb:	8b 45 10             	mov    0x10(%ebp),%eax

static __inline uint32_t
read_eflags(void)
{
        uint32_t eflags;
        __asm __volatile("pushfl; popl %0" : "=r" (eflags));
f0109aee:	9c                   	pushf  
f0109aef:	59                   	pop    %ecx
	 int ef;
	 ef = read_eflags();
	 if (tf->tf_eflags & 0x100)
f0109af0:	8b 50 38             	mov    0x38(%eax),%edx
f0109af3:	f6 c6 01             	test   $0x1,%dh
f0109af6:	74 0a                	je     f0109b02 <_Z8mon_exitiPPcP9Trapframe+0x1d>
	 tf->tf_eflags &= ~(ef | 1 << 8); /* Clear TF to disable single-step mode */
f0109af8:	80 cd 01             	or     $0x1,%ch
f0109afb:	f7 d1                	not    %ecx
f0109afd:	21 ca                	and    %ecx,%edx
f0109aff:	89 50 38             	mov    %edx,0x38(%eax)
	     		"\tpopal\n"
	         	"\tpopl %%es\n"
		     	"\tpopl %%ds\n"
		        "\taddl $0x8,%%esp\n" /* skip tf_trapno and tf_errcode */
			"\tiret"
			: : "g" (tf) : "memory");
f0109b02:	89 c4                	mov    %eax,%esp
f0109b04:	61                   	popa   
f0109b05:	07                   	pop    %es
f0109b06:	1f                   	pop    %ds
f0109b07:	83 c4 08             	add    $0x8,%esp
f0109b0a:	cf                   	iret   
	panic("iret failed"); /* mostly to placate the compiler */
f0109b0b:	c7 44 24 08 1e d4 10 	movl   $0xf010d41e,0x8(%esp)
f0109b12:	f0 
f0109b13:	c7 44 24 04 6f 00 00 	movl   $0x6f,0x4(%esp)
f0109b1a:	00 
f0109b1b:	c7 04 24 2a d4 10 f0 	movl   $0xf010d42a,(%esp)
f0109b22:	e8 39 f5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>

f0109b27 <_Z13mon_backtraceiPPcP9Trapframe>:
	return 0;
}

int
mon_backtrace(int argc, char **argv, struct Trapframe *tf)
{
f0109b27:	55                   	push   %ebp
f0109b28:	89 e5                	mov    %esp,%ebp
f0109b2a:	57                   	push   %edi
f0109b2b:	56                   	push   %esi
f0109b2c:	53                   	push   %ebx
f0109b2d:	83 ec 4c             	sub    $0x4c,%esp
	// Your code here.
        uint32_t *ebp;
	extern char bootstacktop[];
	int i = 0;
	Eipdebuginfo info;
	cprintf("Stack backtrace:\n");
f0109b30:	c7 04 24 39 d4 10 f0 	movl   $0xf010d439,(%esp)
f0109b37:	e8 3b 1f 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	ebp = (uint32_t *)read_ebp();
f0109b3c:	89 eb                	mov    %ebp,%ebx
	cprintf("bootstacktop: %08x\n", (uint32_t *)bootstacktop);
f0109b3e:	c7 44 24 04 00 90 10 	movl   $0xf0109000,0x4(%esp)
f0109b45:	f0 
f0109b46:	c7 04 24 4b d4 10 f0 	movl   $0xf010d44b,(%esp)
f0109b4d:	e8 25 1f 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	while(ebp < (uint32_t *)bootstacktop )
f0109b52:	81 fb 00 90 10 f0    	cmp    $0xf0109000,%ebx
f0109b58:	0f 83 a1 00 00 00    	jae    f0109bff <_Z13mon_backtraceiPPcP9Trapframe+0xd8>
f0109b5e:	bf 00 00 00 00       	mov    $0x0,%edi
	{
        cprintf("%d: ebp %08x eip %08x args %08x %08x %08x %08x\n", i, ebp, *(ebp+1), *(ebp+2), *(ebp+2+1),*(ebp+2+2), *(ebp+2+3));
f0109b63:	8d 73 04             	lea    0x4(%ebx),%esi
f0109b66:	8b 43 14             	mov    0x14(%ebx),%eax
f0109b69:	89 44 24 1c          	mov    %eax,0x1c(%esp)
f0109b6d:	8b 43 10             	mov    0x10(%ebx),%eax
f0109b70:	89 44 24 18          	mov    %eax,0x18(%esp)
f0109b74:	8b 43 0c             	mov    0xc(%ebx),%eax
f0109b77:	89 44 24 14          	mov    %eax,0x14(%esp)
f0109b7b:	8b 43 08             	mov    0x8(%ebx),%eax
f0109b7e:	89 44 24 10          	mov    %eax,0x10(%esp)
f0109b82:	8b 06                	mov    (%esi),%eax
f0109b84:	89 44 24 0c          	mov    %eax,0xc(%esp)
f0109b88:	89 5c 24 08          	mov    %ebx,0x8(%esp)
f0109b8c:	89 7c 24 04          	mov    %edi,0x4(%esp)
f0109b90:	c7 04 24 10 d6 10 f0 	movl   $0xf010d610,(%esp)
f0109b97:	e8 db 1e 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	debuginfo_eip(*(ebp+1), &info);
f0109b9c:	8d 45 d0             	lea    -0x30(%ebp),%eax
f0109b9f:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109ba3:	8b 06                	mov    (%esi),%eax
f0109ba5:	89 04 24             	mov    %eax,(%esp)
f0109ba8:	e8 dd 22 00 00       	call   f010be8a <_Z13debuginfo_eipjP12Eipdebuginfo>
	cprintf("   %s:%d: %s (%d arg)\n", info.eip_file, info.eip_line, info.eip_fn_name, info.eip_fn_narg);
f0109bad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0109bb0:	89 44 24 10          	mov    %eax,0x10(%esp)
f0109bb4:	8b 45 d8             	mov    -0x28(%ebp),%eax
f0109bb7:	89 44 24 0c          	mov    %eax,0xc(%esp)
f0109bbb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f0109bbe:	89 44 24 08          	mov    %eax,0x8(%esp)
f0109bc2:	8b 45 d0             	mov    -0x30(%ebp),%eax
f0109bc5:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109bc9:	c7 04 24 5f d4 10 f0 	movl   $0xf010d45f,(%esp)
f0109bd0:	e8 a2 1e 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	i++;
f0109bd5:	83 c7 01             	add    $0x1,%edi
	if(*ebp == 0 )
f0109bd8:	8b 03                	mov    (%ebx),%eax
f0109bda:	85 c0                	test   %eax,%eax
f0109bdc:	75 12                	jne    f0109bf0 <_Z13mon_backtraceiPPcP9Trapframe+0xc9>
	{
		cprintf("the final value of ebp: %08x\n", ebp);
f0109bde:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f0109be2:	c7 04 24 76 d4 10 f0 	movl   $0xf010d476,(%esp)
f0109be9:	e8 89 1e 00 00       	call   f010ba77 <_Z7cprintfPKcz>
		break;
f0109bee:	eb 0f                	jmp    f0109bff <_Z13mon_backtraceiPPcP9Trapframe+0xd8>
	}
	ebp = (uint32_t *)*ebp;
f0109bf0:	89 c3                	mov    %eax,%ebx
	int i = 0;
	Eipdebuginfo info;
	cprintf("Stack backtrace:\n");
	ebp = (uint32_t *)read_ebp();
	cprintf("bootstacktop: %08x\n", (uint32_t *)bootstacktop);
	while(ebp < (uint32_t *)bootstacktop )
f0109bf2:	b8 00 90 10 f0       	mov    $0xf0109000,%eax
f0109bf7:	39 d8                	cmp    %ebx,%eax
f0109bf9:	0f 87 64 ff ff ff    	ja     f0109b63 <_Z13mon_backtraceiPPcP9Trapframe+0x3c>
		cprintf("the final value of ebp: %08x\n", ebp);
		break;
	}
	ebp = (uint32_t *)*ebp;
	}
	if(tf != NULL)
f0109bff:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
f0109c03:	74 0d                	je     f0109c12 <_Z13mon_backtraceiPPcP9Trapframe+0xeb>
	print_trapframe(tf);
f0109c05:	8b 45 10             	mov    0x10(%ebp),%eax
f0109c08:	89 04 24             	mov    %eax,(%esp)
f0109c0b:	e8 f3 1f 00 00       	call   f010bc03 <_Z15print_trapframeP9Trapframe>
f0109c10:	eb 0c                	jmp    f0109c1e <_Z13mon_backtraceiPPcP9Trapframe+0xf7>
	else
	cprintf("no breakpoint\n");
f0109c12:	c7 04 24 94 d4 10 f0 	movl   $0xf010d494,(%esp)
f0109c19:	e8 59 1e 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	//{
	//cprintf("0x%08x ", ebp);
	//ebp++;
	//}
	return 0;
}
f0109c1e:	b8 00 00 00 00       	mov    $0x0,%eax
f0109c23:	83 c4 4c             	add    $0x4c,%esp
f0109c26:	5b                   	pop    %ebx
f0109c27:	5e                   	pop    %esi
f0109c28:	5f                   	pop    %edi
f0109c29:	5d                   	pop    %ebp
f0109c2a:	c3                   	ret    
f0109c2b:	00 00                	add    %al,(%eax)
f0109c2d:	00 00                	add    %al,(%eax)
	...

f0109c30 <_Z14tlb_invalidatePjj>:

// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
void
tlb_invalidate(pde_t *pgdir, uintptr_t va)
{
f0109c30:	55                   	push   %ebp
f0109c31:	89 e5                	mov    %esp,%ebp
}

static __inline void 
invlpg(uintptr_t addr)
{ 
	__asm __volatile("invlpg (%0)" : : "r" (addr) : "memory");
f0109c33:	8b 45 0c             	mov    0xc(%ebp),%eax
f0109c36:	0f 01 38             	invlpg (%eax)
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}
f0109c39:	5d                   	pop    %ebp
f0109c3a:	c3                   	ret    

f0109c3b <_GLOBAL__I_npages>:
	page_free(pp0);
	page_free(pp1);
	page_free(pp2);
	
	cprintf("page_check() succeeded!\n");
}
f0109c3b:	55                   	push   %ebp
f0109c3c:	89 e5                	mov    %esp,%ebp
	SEG(STA_W, 0x0, 0xffffffff, 0),		// 0x10 - kernel data segment
	SEG(STA_X | STA_R, 0x0, 0xffffffff, 3),	// 0x18 - user code segment
	SEG(STA_W, 0x0, 0xffffffff, 3),		// 0x20 - user data segment
	SEG_NULL				// 0x28 - tss, initialized in
						// idt_init()
};
f0109c3e:	a1 d8 dc 10 f0       	mov    0xf010dcd8,%eax
f0109c43:	8b 15 dc dc 10 f0    	mov    0xf010dcdc,%edx
f0109c49:	a3 60 e3 11 f0       	mov    %eax,0xf011e360
f0109c4e:	89 15 64 e3 11 f0    	mov    %edx,0xf011e364
f0109c54:	a1 e0 dc 10 f0       	mov    0xf010dce0,%eax
f0109c59:	8b 15 e4 dc 10 f0    	mov    0xf010dce4,%edx
f0109c5f:	a3 68 e3 11 f0       	mov    %eax,0xf011e368
f0109c64:	89 15 6c e3 11 f0    	mov    %edx,0xf011e36c
f0109c6a:	a1 e8 dc 10 f0       	mov    0xf010dce8,%eax
f0109c6f:	8b 15 ec dc 10 f0    	mov    0xf010dcec,%edx
f0109c75:	a3 70 e3 11 f0       	mov    %eax,0xf011e370
f0109c7a:	89 15 74 e3 11 f0    	mov    %edx,0xf011e374
f0109c80:	a1 f0 dc 10 f0       	mov    0xf010dcf0,%eax
f0109c85:	8b 15 f4 dc 10 f0    	mov    0xf010dcf4,%edx
f0109c8b:	a3 78 e3 11 f0       	mov    %eax,0xf011e378
f0109c90:	89 15 7c e3 11 f0    	mov    %edx,0xf011e37c
f0109c96:	a1 f8 dc 10 f0       	mov    0xf010dcf8,%eax
f0109c9b:	8b 15 fc dc 10 f0    	mov    0xf010dcfc,%edx
f0109ca1:	a3 80 e3 11 f0       	mov    %eax,0xf011e380
f0109ca6:	89 15 84 e3 11 f0    	mov    %edx,0xf011e384
f0109cac:	a1 00 dd 10 f0       	mov    0xf010dd00,%eax
f0109cb1:	8b 15 04 dd 10 f0    	mov    0xf010dd04,%edx
f0109cb7:	a3 88 e3 11 f0       	mov    %eax,0xf011e388
f0109cbc:	89 15 8c e3 11 f0    	mov    %edx,0xf011e38c
	page_free(pp0);
	page_free(pp1);
	page_free(pp2);
	
	cprintf("page_check() succeeded!\n");
}
f0109cc2:	5d                   	pop    %ebp
f0109cc3:	c3                   	ret    

f0109cc4 <_ZL10boot_allocj>:
// If we're out of memory, boot_alloc should panic.
// This function may ONLY be used during initialization,
// before the free_pages list has been set up.
static void *
boot_alloc(uint32_t n)
{
f0109cc4:	55                   	push   %ebp
f0109cc5:	89 e5                	mov    %esp,%ebp
f0109cc7:	53                   	push   %ebx
f0109cc8:	83 ec 14             	sub    $0x14,%esp
	// Initialize nextfree if this is the first time.
	// 'end' is a magic symbol automatically generated by the linker,
	// which points to the end of the kernel's bss segment:
	// the first virtual address that the linker did *not* assign
	// to any kernel code or global variables.
	if (nextfree == 0)
f0109ccb:	83 3d 98 e3 11 f0 00 	cmpl   $0x0,0xf011e398
f0109cd2:	75 19                	jne    f0109ced <_ZL10boot_allocj+0x29>
		nextfree = round_up((char *) end, PGSIZE);
f0109cd4:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f0109cdb:	00 
f0109cdc:	c7 04 24 20 f0 11 f0 	movl   $0xf011f020,(%esp)
f0109ce3:	e8 c7 1c 00 00       	call   f010b9af <_Z8round_upIPcET_S1_j>
f0109ce8:	a3 98 e3 11 f0       	mov    %eax,0xf011e398
	// nextfree.  Make sure nextfree is kept aligned
	// to a multiple of PGSIZE.
	//
	// LAB 2: Your code here.
	// Hole 'n' bytes memory
	v = (void *) nextfree;
f0109ced:	8b 1d 98 e3 11 f0    	mov    0xf011e398,%ebx
	nextfree += n;
	// Align nextfree
	nextfree = round_up (nextfree, PGSIZE);
f0109cf3:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f0109cfa:	00 
f0109cfb:	89 d8                	mov    %ebx,%eax
f0109cfd:	03 45 08             	add    0x8(%ebp),%eax
f0109d00:	89 04 24             	mov    %eax,(%esp)
f0109d03:	e8 a7 1c 00 00       	call   f010b9af <_Z8round_upIPcET_S1_j>
f0109d08:	a3 98 e3 11 f0       	mov    %eax,0xf011e398
	// Panic when out of memory
	if((unsigned int) nextfree < (unsigned int) end)
f0109d0d:	3d 20 f0 11 f0       	cmp    $0xf011f020,%eax
f0109d12:	73 1c                	jae    f0109d30 <_ZL10boot_allocj+0x6c>
	panic("boot_alloc: out of memory.\n");
f0109d14:	c7 44 24 08 d3 da 10 	movl   $0xf010dad3,0x8(%esp)
f0109d1b:	f0 
f0109d1c:	c7 44 24 04 06 01 00 	movl   $0x106,0x4(%esp)
f0109d23:	00 
f0109d24:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f0109d2b:	e8 30 f3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// Return updated pointer points after 'n' bytes
	//v = (void *) nextfree;
	return v;
}
f0109d30:	89 d8                	mov    %ebx,%eax
f0109d32:	83 c4 14             	add    $0x14,%esp
f0109d35:	5b                   	pop    %ebx
f0109d36:	5d                   	pop    %ebp
f0109d37:	c3                   	ret    

f0109d38 <_ZL11check_va2paPjj>:
// defined by the page directory 'pgdir'.  The hardware normally performs
// this functionality for us!  We define our own version to help
// the boot_mem_check() function; it shouldn't be used elsewhere.
static physaddr_t
check_va2pa(pde_t *pgdir, uintptr_t va)
{
f0109d38:	55                   	push   %ebp
f0109d39:	89 e5                	mov    %esp,%ebp
f0109d3b:	83 ec 18             	sub    $0x18,%esp
	pte_t *p;

	pgdir = &pgdir[PDX(va)];
	if (!(*pgdir & PTE_P))
f0109d3e:	89 d1                	mov    %edx,%ecx
f0109d40:	c1 e9 16             	shr    $0x16,%ecx
f0109d43:	8b 04 88             	mov    (%eax,%ecx,4),%eax
f0109d46:	a8 01                	test   $0x1,%al
f0109d48:	74 4d                	je     f0109d97 <_ZL11check_va2paPjj+0x5f>
		return ~0;
	p = (pte_t*) KADDR(PTE_ADDR(*pgdir));
f0109d4a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0109d4f:	89 c1                	mov    %eax,%ecx
f0109d51:	c1 e9 0c             	shr    $0xc,%ecx
f0109d54:	3b 0d 40 e3 11 f0    	cmp    0xf011e340,%ecx
f0109d5a:	72 20                	jb     f0109d7c <_ZL11check_va2paPjj+0x44>
f0109d5c:	89 44 24 0c          	mov    %eax,0xc(%esp)
f0109d60:	c7 44 24 08 d8 d6 10 	movl   $0xf010d6d8,0x8(%esp)
f0109d67:	f0 
f0109d68:	c7 44 24 04 19 01 00 	movl   $0x119,0x4(%esp)
f0109d6f:	00 
f0109d70:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f0109d77:	e8 e4 f2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	if (!(p[PTX(va)] & PTE_P))
f0109d7c:	c1 ea 0c             	shr    $0xc,%edx
f0109d7f:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
f0109d85:	8b 84 90 00 00 00 f0 	mov    -0x10000000(%eax,%edx,4),%eax
f0109d8c:	a8 01                	test   $0x1,%al
f0109d8e:	74 07                	je     f0109d97 <_ZL11check_va2paPjj+0x5f>
		return ~0;
	return PTE_ADDR(p[PTX(va)]);
f0109d90:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0109d95:	eb 05                	jmp    f0109d9c <_ZL11check_va2paPjj+0x64>
f0109d97:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
f0109d9c:	c9                   	leave  
f0109d9d:	c3                   	ret    

f0109d9e <_ZL14boot_mem_checkv>:
// This function doesn't test every corner case,
// and doesn't test the permission bits at all,
// but it is a pretty good sanity check.
static void
boot_mem_check(void)
{
f0109d9e:	55                   	push   %ebp
f0109d9f:	89 e5                	mov    %esp,%ebp
f0109da1:	57                   	push   %edi
f0109da2:	56                   	push   %esi
f0109da3:	53                   	push   %ebx
f0109da4:	83 ec 1c             	sub    $0x1c,%esp
f0109da7:	bb 00 00 00 00       	mov    $0x0,%ebx
	uint32_t i, n;

	// check phys mem
	for (i = 0; KERNBASE + i != 0; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KERNBASE + i) == i);
f0109dac:	8d 93 00 00 00 f0    	lea    -0x10000000(%ebx),%edx
f0109db2:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f0109db7:	e8 7c ff ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f0109dbc:	39 c3                	cmp    %eax,%ebx
f0109dbe:	74 24                	je     f0109de4 <_ZL14boot_mem_checkv+0x46>
f0109dc0:	c7 44 24 0c fc d6 10 	movl   $0xf010d6fc,0xc(%esp)
f0109dc7:	f0 
f0109dc8:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f0109dcf:	f0 
f0109dd0:	c7 44 24 04 90 02 00 	movl   $0x290,0x4(%esp)
f0109dd7:	00 
f0109dd8:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f0109ddf:	e8 7c f2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
boot_mem_check(void)
{
	uint32_t i, n;

	// check phys mem
	for (i = 0; KERNBASE + i != 0; i += PGSIZE)
f0109de4:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f0109dea:	81 fb 00 00 00 10    	cmp    $0x10000000,%ebx
f0109df0:	75 ba                	jne    f0109dac <_ZL14boot_mem_checkv+0xe>
f0109df2:	be 00 80 ff ef       	mov    $0xefff8000,%esi
		assert(check_va2pa(kern_pgdir, KERNBASE + i) == i);

	// check kernel stack
	for (i = 0; i < KSTKSIZE; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KSTACKTOP - KSTKSIZE + i) == PADDR(bootstack) + i);
f0109df7:	bb 00 10 10 f0       	mov    $0xf0101000,%ebx
f0109dfc:	8d bb 00 80 00 20    	lea    0x20008000(%ebx),%edi
f0109e02:	89 f2                	mov    %esi,%edx
f0109e04:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f0109e09:	e8 2a ff ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f0109e0e:	81 fb ff ff ff ef    	cmp    $0xefffffff,%ebx
f0109e14:	77 20                	ja     f0109e36 <_ZL14boot_mem_checkv+0x98>
f0109e16:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
f0109e1a:	c7 44 24 08 28 d7 10 	movl   $0xf010d728,0x8(%esp)
f0109e21:	f0 
f0109e22:	c7 44 24 04 94 02 00 	movl   $0x294,0x4(%esp)
f0109e29:	00 
f0109e2a:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f0109e31:	e8 2a f2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f0109e36:	8d 14 37             	lea    (%edi,%esi,1),%edx
f0109e39:	39 d0                	cmp    %edx,%eax
f0109e3b:	74 24                	je     f0109e61 <_ZL14boot_mem_checkv+0xc3>
f0109e3d:	c7 44 24 0c 4c d7 10 	movl   $0xf010d74c,0xc(%esp)
f0109e44:	f0 
f0109e45:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f0109e4c:	f0 
f0109e4d:	c7 44 24 04 94 02 00 	movl   $0x294,0x4(%esp)
f0109e54:	00 
f0109e55:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f0109e5c:	e8 ff f1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f0109e61:	81 c6 00 10 00 00    	add    $0x1000,%esi
	// check phys mem
	for (i = 0; KERNBASE + i != 0; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KERNBASE + i) == i);

	// check kernel stack
	for (i = 0; i < KSTKSIZE; i += PGSIZE)
f0109e67:	81 fe 00 00 00 f0    	cmp    $0xf0000000,%esi
f0109e6d:	75 93                	jne    f0109e02 <_ZL14boot_mem_checkv+0x64>
		case PDX(KSTACKTOP-1):
			assert(kern_pgdir[i]);
			break;
		default:
			if (i >= PDX(KERNBASE))
				assert(kern_pgdir[i]);
f0109e6f:	8b 0d 44 e3 11 f0    	mov    0xf011e344,%ecx

	// check for zero/non-zero in PDEs
	for (i = 0; i < NPDENTRIES; i++) {
		switch (i) {
		case PDX(KSTACKTOP-1):
			assert(kern_pgdir[i]);
f0109e75:	8d 99 fc 0e 00 00    	lea    0xefc(%ecx),%ebx
f0109e7b:	b8 01 00 00 00       	mov    $0x1,%eax
f0109e80:	eb 03                	jmp    f0109e85 <_ZL14boot_mem_checkv+0xe7>
f0109e82:	83 c0 01             	add    $0x1,%eax
f0109e85:	8d 50 ff             	lea    -0x1(%eax),%edx
	for (i = 0; i < KSTKSIZE; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KSTACKTOP - KSTKSIZE + i) == PADDR(bootstack) + i);

	// check for zero/non-zero in PDEs
	for (i = 0; i < NPDENTRIES; i++) {
		switch (i) {
f0109e88:	81 fa bf 03 00 00    	cmp    $0x3bf,%edx
f0109e8e:	75 29                	jne    f0109eb9 <_ZL14boot_mem_checkv+0x11b>
		case PDX(KSTACKTOP-1):
			assert(kern_pgdir[i]);
f0109e90:	83 3b 00             	cmpl   $0x0,(%ebx)
f0109e93:	75 ed                	jne    f0109e82 <_ZL14boot_mem_checkv+0xe4>
f0109e95:	c7 44 24 0c fb da 10 	movl   $0xf010dafb,0xc(%esp)
f0109e9c:	f0 
f0109e9d:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f0109ea4:	f0 
f0109ea5:	c7 44 24 04 9a 02 00 	movl   $0x29a,0x4(%esp)
f0109eac:	00 
f0109ead:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f0109eb4:	e8 a7 f1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
			break;
		default:
			if (i >= PDX(KERNBASE))
f0109eb9:	81 fa bf 03 00 00    	cmp    $0x3bf,%edx
f0109ebf:	76 2b                	jbe    f0109eec <_ZL14boot_mem_checkv+0x14e>
				assert(kern_pgdir[i]);
f0109ec1:	83 7c 81 fc 00       	cmpl   $0x0,-0x4(%ecx,%eax,4)
f0109ec6:	75 4f                	jne    f0109f17 <_ZL14boot_mem_checkv+0x179>
f0109ec8:	c7 44 24 0c fb da 10 	movl   $0xf010dafb,0xc(%esp)
f0109ecf:	f0 
f0109ed0:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f0109ed7:	f0 
f0109ed8:	c7 44 24 04 9e 02 00 	movl   $0x29e,0x4(%esp)
f0109edf:	00 
f0109ee0:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f0109ee7:	e8 74 f1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
			else
				assert(kern_pgdir[i] == 0);
f0109eec:	83 7c 81 fc 00       	cmpl   $0x0,-0x4(%ecx,%eax,4)
f0109ef1:	74 24                	je     f0109f17 <_ZL14boot_mem_checkv+0x179>
f0109ef3:	c7 44 24 0c 09 db 10 	movl   $0xf010db09,0xc(%esp)
f0109efa:	f0 
f0109efb:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f0109f02:	f0 
f0109f03:	c7 44 24 04 a0 02 00 	movl   $0x2a0,0x4(%esp)
f0109f0a:	00 
f0109f0b:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f0109f12:	e8 49 f1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// check kernel stack
	for (i = 0; i < KSTKSIZE; i += PGSIZE)
		assert(check_va2pa(kern_pgdir, KSTACKTOP - KSTKSIZE + i) == PADDR(bootstack) + i);

	// check for zero/non-zero in PDEs
	for (i = 0; i < NPDENTRIES; i++) {
f0109f17:	3d ff 03 00 00       	cmp    $0x3ff,%eax
f0109f1c:	0f 86 60 ff ff ff    	jbe    f0109e82 <_ZL14boot_mem_checkv+0xe4>
				assert(kern_pgdir[i] == 0);
			break;
		}
	}
	
	cprintf("boot_mem_check() succeeded!\n");
f0109f22:	c7 04 24 1c db 10 f0 	movl   $0xf010db1c,(%esp)
f0109f29:	e8 49 1b 00 00       	call   f010ba77 <_Z7cprintfPKcz>
}
f0109f2e:	83 c4 1c             	add    $0x1c,%esp
f0109f31:	5b                   	pop    %ebx
f0109f32:	5e                   	pop    %esi
f0109f33:	5f                   	pop    %edi
f0109f34:	5d                   	pop    %ebp
f0109f35:	c3                   	ret    

f0109f36 <_ZL10nvram_readi>:
	sizeof(gdt) - 1, (unsigned long) gdt
};

static int
nvram_read(int r)
{
f0109f36:	55                   	push   %ebp
f0109f37:	89 e5                	mov    %esp,%ebp
f0109f39:	83 ec 18             	sub    $0x18,%esp
f0109f3c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
f0109f3f:	89 75 fc             	mov    %esi,-0x4(%ebp)
f0109f42:	89 c3                	mov    %eax,%ebx
	return mc146818_read(r) | (mc146818_read(r + 1) << 8);
f0109f44:	89 04 24             	mov    %eax,(%esp)
f0109f47:	e8 d0 1a 00 00       	call   f010ba1c <_Z13mc146818_readj>
f0109f4c:	89 c6                	mov    %eax,%esi
f0109f4e:	83 c3 01             	add    $0x1,%ebx
f0109f51:	89 1c 24             	mov    %ebx,(%esp)
f0109f54:	e8 c3 1a 00 00       	call   f010ba1c <_Z13mc146818_readj>
f0109f59:	c1 e0 08             	shl    $0x8,%eax
f0109f5c:	09 f0                	or     %esi,%eax
}
f0109f5e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
f0109f61:	8b 75 fc             	mov    -0x4(%ebp),%esi
f0109f64:	89 ec                	mov    %ebp,%esp
f0109f66:	5d                   	pop    %ebp
f0109f67:	c3                   	ret    

f0109f68 <_ZL15i386_mem_detectv>:

static void
i386_mem_detect(void)
{
f0109f68:	55                   	push   %ebp
f0109f69:	89 e5                	mov    %esp,%ebp
f0109f6b:	53                   	push   %ebx
f0109f6c:	83 ec 14             	sub    $0x14,%esp
	uint32_t n_extended_pages;
	
	// Use CMOS calls to measure available base & extended memory.
	// (CMOS calls return results in kilobytes.)
	n_base_pages = nvram_read(NVRAM_BASELO) * 1024 / PGSIZE;
f0109f6f:	b8 15 00 00 00       	mov    $0x15,%eax
f0109f74:	e8 bd ff ff ff       	call   f0109f36 <_ZL10nvram_readi>
f0109f79:	c1 e0 0a             	shl    $0xa,%eax
f0109f7c:	89 c2                	mov    %eax,%edx
f0109f7e:	c1 fa 1f             	sar    $0x1f,%edx
f0109f81:	c1 ea 14             	shr    $0x14,%edx
f0109f84:	8d 04 02             	lea    (%edx,%eax,1),%eax
f0109f87:	c1 f8 0c             	sar    $0xc,%eax
f0109f8a:	a3 94 e3 11 f0       	mov    %eax,0xf011e394
	n_extended_pages = nvram_read(NVRAM_EXTLO) * 1024 / PGSIZE;
f0109f8f:	b8 17 00 00 00       	mov    $0x17,%eax
f0109f94:	e8 9d ff ff ff       	call   f0109f36 <_ZL10nvram_readi>
f0109f99:	c1 e0 0a             	shl    $0xa,%eax
f0109f9c:	89 c3                	mov    %eax,%ebx
f0109f9e:	c1 fb 1f             	sar    $0x1f,%ebx
f0109fa1:	c1 eb 14             	shr    $0x14,%ebx
f0109fa4:	01 c3                	add    %eax,%ebx
f0109fa6:	c1 fb 0c             	sar    $0xc,%ebx

	// Calculate the maximum physical address based on whether
	// or not there is any extended memory.  See comment in <inc/mmu.h>.
	if (n_extended_pages)
f0109fa9:	85 db                	test   %ebx,%ebx
f0109fab:	74 0d                	je     f0109fba <_ZL15i386_mem_detectv+0x52>
		npages = (EXTPHYSMEM / PGSIZE) + n_extended_pages;
f0109fad:	8d 83 00 01 00 00    	lea    0x100(%ebx),%eax
f0109fb3:	a3 40 e3 11 f0       	mov    %eax,0xf011e340
f0109fb8:	eb 0a                	jmp    f0109fc4 <_ZL15i386_mem_detectv+0x5c>
	else
		npages = n_base_pages;
f0109fba:	a1 94 e3 11 f0       	mov    0xf011e394,%eax
f0109fbf:	a3 40 e3 11 f0       	mov    %eax,0xf011e340

	cprintf("Physical memory: %uK available, ", npages * PGSIZE / 1024);
f0109fc4:	a1 40 e3 11 f0       	mov    0xf011e340,%eax
f0109fc9:	c1 e0 0c             	shl    $0xc,%eax
f0109fcc:	c1 e8 0a             	shr    $0xa,%eax
f0109fcf:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109fd3:	c7 04 24 98 d7 10 f0 	movl   $0xf010d798,(%esp)
f0109fda:	e8 98 1a 00 00       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("base = %uK, extended = %uK\n", n_base_pages * PGSIZE / 1024,
		n_extended_pages * PGSIZE / 1024);
f0109fdf:	c1 e3 0c             	shl    $0xc,%ebx
f0109fe2:	c1 eb 0a             	shr    $0xa,%ebx
f0109fe5:	89 5c 24 08          	mov    %ebx,0x8(%esp)
f0109fe9:	a1 94 e3 11 f0       	mov    0xf011e394,%eax
f0109fee:	c1 e0 0c             	shl    $0xc,%eax
f0109ff1:	c1 e8 0a             	shr    $0xa,%eax
f0109ff4:	89 44 24 04          	mov    %eax,0x4(%esp)
f0109ff8:	c7 04 24 39 db 10 f0 	movl   $0xf010db39,(%esp)
f0109fff:	e8 73 1a 00 00       	call   f010ba77 <_Z7cprintfPKcz>
}
f010a004:	83 c4 14             	add    $0x14,%esp
f010a007:	5b                   	pop    %ebx
f010a008:	5d                   	pop    %ebp
f010a009:	c3                   	ret    

f010a00a <_Z9page_freeP4Page>:
// Software Engineering Hint: It can be extremely useful for later debugging
//   if you erase each page's memory as soon as it is freed.  See the Software
//   Engineering Hint above for reasons why.
void
page_free(struct Page *pp)
{
f010a00a:	55                   	push   %ebp
f010a00b:	89 e5                	mov    %esp,%ebp
f010a00d:	83 ec 18             	sub    $0x18,%esp
f010a010:	8b 45 08             	mov    0x8(%ebp),%eax
	// Fill this function in
	//Only be called when pp_ref reaches 0
	assert(pp->pp_ref == 0);
f010a013:	66 83 78 04 00       	cmpw   $0x0,0x4(%eax)
f010a018:	74 24                	je     f010a03e <_Z9page_freeP4Page+0x34>
f010a01a:	c7 44 24 0c 55 db 10 	movl   $0xf010db55,0xc(%esp)
f010a021:	f0 
f010a022:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a029:	f0 
f010a02a:	c7 44 24 04 86 01 00 	movl   $0x186,0x4(%esp)
f010a031:	00 
f010a032:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a039:	e8 22 f0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	//Add free page to link free_pages
	pp->pp_next = free_pages;
f010a03e:	8b 15 90 e3 11 f0    	mov    0xf011e390,%edx
f010a044:	89 10                	mov    %edx,(%eax)
	free_pages = pp;
f010a046:	a3 90 e3 11 f0       	mov    %eax,0xf011e390
	uint16_t pp_ref;

#if JOS_KERNEL
	// Returns the physical page number for this page.
	size_t page_number() const {
		assert(this >= pages && this < pages + npages);
f010a04b:	8b 15 48 e3 11 f0    	mov    0xf011e348,%edx
f010a051:	39 d0                	cmp    %edx,%eax
f010a053:	72 0d                	jb     f010a062 <_Z9page_freeP4Page+0x58>
f010a055:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010a05b:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010a05e:	39 c8                	cmp    %ecx,%eax
f010a060:	72 24                	jb     f010a086 <_Z9page_freeP4Page+0x7c>
f010a062:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010a069:	f0 
f010a06a:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a071:	f0 
f010a072:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a079:	00 
f010a07a:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010a081:	e8 da ef ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	//erase page memory
	memset(pp->data(), 0xCD, sizeof(*pp));
f010a086:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
f010a08d:	00 
f010a08e:	c7 44 24 04 cd 00 00 	movl   $0xcd,0x4(%esp)
f010a095:	00 
f010a096:	29 d0                	sub    %edx,%eax
f010a098:	c1 f8 03             	sar    $0x3,%eax
f010a09b:	c1 e0 0c             	shl    $0xc,%eax
f010a09e:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010a0a3:	89 04 24             	mov    %eax,(%esp)
f010a0a6:	e8 83 28 00 00       	call   f010c92e <_Z6memsetPvij>
}
f010a0ab:	c9                   	leave  
f010a0ac:	c3                   	ret    

f010a0ad <_Z11page_decrefP4Page>:

// Decrement the reference count on a page.
// Free it if there are no more refs afterwards.
void
page_decref(struct Page *pp)
{
f010a0ad:	55                   	push   %ebp
f010a0ae:	89 e5                	mov    %esp,%ebp
f010a0b0:	83 ec 18             	sub    $0x18,%esp
f010a0b3:	8b 45 08             	mov    0x8(%ebp),%eax
	if (--pp->pp_ref == 0)
f010a0b6:	0f b7 50 04          	movzwl 0x4(%eax),%edx
f010a0ba:	83 ea 01             	sub    $0x1,%edx
f010a0bd:	66 89 50 04          	mov    %dx,0x4(%eax)
f010a0c1:	66 85 d2             	test   %dx,%dx
f010a0c4:	75 08                	jne    f010a0ce <_Z11page_decrefP4Page+0x21>
		page_free(pp);
f010a0c6:	89 04 24             	mov    %eax,(%esp)
f010a0c9:	e8 3c ff ff ff       	call   f010a00a <_Z9page_freeP4Page>
}
f010a0ce:	c9                   	leave  
f010a0cf:	c3                   	ret    

f010a0d0 <_Z10page_allocv>:
//   kernel boots, a data structure gets corrupted because its containing page
//   was used twice!  Note that erasing the page with a non-zero value is
//   usually better than erasing it with 0.  (Why might this be?)
struct Page *
page_alloc()
{
f010a0d0:	55                   	push   %ebp
f010a0d1:	89 e5                	mov    %esp,%ebp
f010a0d3:	53                   	push   %ebx
f010a0d4:	83 ec 14             	sub    $0x14,%esp
	// Fill this function in
	struct Page * alloc_page;
	if (free_pages == NULL)
f010a0d7:	8b 1d 90 e3 11 f0    	mov    0xf011e390,%ebx
f010a0dd:	85 db                	test   %ebx,%ebx
f010a0df:	74 70                	je     f010a151 <_Z10page_allocv+0x81>
	return NULL;
	// Get a free page from link free_pages, but no initial
	alloc_page = free_pages;
	// Delete allocted page from link free_pages
	free_pages = free_pages->pp_next;
f010a0e1:	8b 03                	mov    (%ebx),%eax
f010a0e3:	a3 90 e3 11 f0       	mov    %eax,0xf011e390
	alloc_page->pp_next = NULL;
f010a0e8:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
f010a0ee:	a1 48 e3 11 f0       	mov    0xf011e348,%eax
f010a0f3:	39 c3                	cmp    %eax,%ebx
f010a0f5:	72 0d                	jb     f010a104 <_Z10page_allocv+0x34>
f010a0f7:	8b 15 40 e3 11 f0    	mov    0xf011e340,%edx
f010a0fd:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010a100:	39 d3                	cmp    %edx,%ebx
f010a102:	72 24                	jb     f010a128 <_Z10page_allocv+0x58>
f010a104:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010a10b:	f0 
f010a10c:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a113:	f0 
f010a114:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a11b:	00 
f010a11c:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010a123:	e8 38 ef ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// Erase allocted memory
	memset(alloc_page->data(), 0xCC, sizeof(*alloc_page));
f010a128:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
f010a12f:	00 
f010a130:	c7 44 24 04 cc 00 00 	movl   $0xcc,0x4(%esp)
f010a137:	00 
f010a138:	89 da                	mov    %ebx,%edx
f010a13a:	29 c2                	sub    %eax,%edx
f010a13c:	89 d0                	mov    %edx,%eax
f010a13e:	c1 f8 03             	sar    $0x3,%eax
f010a141:	c1 e0 0c             	shl    $0xc,%eax
f010a144:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010a149:	89 04 24             	mov    %eax,(%esp)
f010a14c:	e8 dd 27 00 00       	call   f010c92e <_Z6memsetPvij>
	return alloc_page;
}
f010a151:	89 d8                	mov    %ebx,%eax
f010a153:	83 c4 14             	add    $0x14,%esp
f010a156:	5b                   	pop    %ebx
f010a157:	5d                   	pop    %ebp
f010a158:	c3                   	ret    

f010a159 <_Z10pgdir_walkPjji>:
//
// Hint: you can turn a Page * into the physical address of the
// page it refers to with Page::physaddr() from inc/memlayout.h.
pte_t *
pgdir_walk(pde_t *pgdir, uintptr_t va, int create)
{
f010a159:	55                   	push   %ebp
f010a15a:	89 e5                	mov    %esp,%ebp
f010a15c:	83 ec 28             	sub    $0x28,%esp
f010a15f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010a162:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010a165:	89 7d fc             	mov    %edi,-0x4(%ebp)
f010a168:	8b 75 0c             	mov    0xc(%ebp),%esi
	// Fill this function in
	struct Page *newpage;
	// If find, return the pointer to the page table entry(PTE)
	if((pgdir[PDX(va)] & PTE_P) != 0)
f010a16b:	89 f3                	mov    %esi,%ebx
f010a16d:	c1 eb 16             	shr    $0x16,%ebx
f010a170:	c1 e3 02             	shl    $0x2,%ebx
f010a173:	03 5d 08             	add    0x8(%ebp),%ebx
f010a176:	8b 03                	mov    (%ebx),%eax
f010a178:	a8 01                	test   $0x1,%al
f010a17a:	74 47                	je     f010a1c3 <_Z10pgdir_walkPjji+0x6a>
	return &(((pte_t *)KADDR(PTE_ADDR(pgdir[PDX(va)])))[PTX(va)]); 
f010a17c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f010a181:	89 c2                	mov    %eax,%edx
f010a183:	c1 ea 0c             	shr    $0xc,%edx
f010a186:	3b 15 40 e3 11 f0    	cmp    0xf011e340,%edx
f010a18c:	72 20                	jb     f010a1ae <_Z10pgdir_walkPjji+0x55>
f010a18e:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010a192:	c7 44 24 08 d8 d6 10 	movl   $0xf010d6d8,0x8(%esp)
f010a199:	f0 
f010a19a:	c7 44 24 04 aa 01 00 	movl   $0x1aa,0x4(%esp)
f010a1a1:	00 
f010a1a2:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a1a9:	e8 b2 ee ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a1ae:	c1 ee 0a             	shr    $0xa,%esi
f010a1b1:	81 e6 fc 0f 00 00    	and    $0xffc,%esi
f010a1b7:	8d 84 30 00 00 00 f0 	lea    -0x10000000(%eax,%esi,1),%eax
f010a1be:	e9 a1 00 00 00       	jmp    f010a264 <_Z10pgdir_walkPjji+0x10b>
	// If create == 0, pgdir_walk returns NULL
	else if(create == 0)
f010a1c3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
f010a1c7:	0f 84 92 00 00 00    	je     f010a25f <_Z10pgdir_walkPjji+0x106>
		return NULL;
	     else
		{
	// Allocate a new page table
		newpage = page_alloc();
f010a1cd:	e8 fe fe ff ff       	call   f010a0d0 <_Z10page_allocv>
f010a1d2:	89 c7                	mov    %eax,%edi
		if(!newpage)
f010a1d4:	85 c0                	test   %eax,%eax
f010a1d6:	0f 84 83 00 00 00    	je     f010a25f <_Z10pgdir_walkPjji+0x106>
			return NULL;
		newpage->pp_ref++;
f010a1dc:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
		return this - pages;
	}
	
	// Returns a kernel virtual pointer to the corresponding page.
	void *data() const {
		return (void *) (KERNBASE + page_number() * PGSIZE);
f010a1e1:	89 04 24             	mov    %eax,(%esp)
f010a1e4:	e8 e5 17 00 00       	call   f010b9ce <_ZNK4Page11page_numberEv>
		memset(newpage->data(), 0, PGSIZE);
f010a1e9:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010a1f0:	00 
f010a1f1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010a1f8:	00 
f010a1f9:	c1 e0 0c             	shl    $0xc,%eax
f010a1fc:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010a201:	89 04 24             	mov    %eax,(%esp)
f010a204:	e8 25 27 00 00       	call   f010c92e <_Z6memsetPvij>
	}

	// Returns the physical address for this page.
	physaddr_t physaddr() const {
		return page_number() * PGSIZE;
f010a209:	89 3c 24             	mov    %edi,(%esp)
f010a20c:	e8 bd 17 00 00       	call   f010b9ce <_ZNK4Page11page_numberEv>
		pgdir[PDX(va)] = newpage->physaddr() | PTE_P | PTE_U | PTE_W;
f010a211:	c1 e0 0c             	shl    $0xc,%eax
f010a214:	83 c8 07             	or     $0x7,%eax
f010a217:	89 03                	mov    %eax,(%ebx)
	// Return the new page entry pointer
		return &(((pte_t *)KADDR(PTE_ADDR(pgdir[PDX(va)])))[PTX(va)]);
f010a219:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f010a21e:	89 c2                	mov    %eax,%edx
f010a220:	c1 ea 0c             	shr    $0xc,%edx
f010a223:	3b 15 40 e3 11 f0    	cmp    0xf011e340,%edx
f010a229:	72 20                	jb     f010a24b <_Z10pgdir_walkPjji+0xf2>
f010a22b:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010a22f:	c7 44 24 08 d8 d6 10 	movl   $0xf010d6d8,0x8(%esp)
f010a236:	f0 
f010a237:	c7 44 24 04 b8 01 00 	movl   $0x1b8,0x4(%esp)
f010a23e:	00 
f010a23f:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a246:	e8 15 ee ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a24b:	c1 ee 0a             	shr    $0xa,%esi
f010a24e:	89 f2                	mov    %esi,%edx
f010a250:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
f010a256:	8d 84 10 00 00 00 f0 	lea    -0x10000000(%eax,%edx,1),%eax
f010a25d:	eb 05                	jmp    f010a264 <_Z10pgdir_walkPjji+0x10b>
f010a25f:	b8 00 00 00 00       	mov    $0x0,%eax
		}	
	return NULL;
}
f010a264:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010a267:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010a26a:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010a26d:	89 ec                	mov    %ebp,%esp
f010a26f:	5d                   	pop    %ebp
f010a270:	c3                   	ret    

f010a271 <_Z11page_lookupPjjPS_>:
// Returns 0 if there is no page mapped at va.
//
// Hint: the TA solution uses pgdir_walk.
struct Page *
page_lookup(pde_t *pgdir, uintptr_t va, pte_t **pte_store)
{
f010a271:	55                   	push   %ebp
f010a272:	89 e5                	mov    %esp,%ebp
f010a274:	53                   	push   %ebx
f010a275:	83 ec 14             	sub    $0x14,%esp
f010a278:	8b 5d 10             	mov    0x10(%ebp),%ebx
	// Fill this function in
	// Lookup virtual address 'va' in page direction
	pte_t *ppte = pgdir_walk(pgdir, va, 0);
f010a27b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010a282:	00 
f010a283:	8b 45 0c             	mov    0xc(%ebp),%eax
f010a286:	89 44 24 04          	mov    %eax,0x4(%esp)
f010a28a:	8b 45 08             	mov    0x8(%ebp),%eax
f010a28d:	89 04 24             	mov    %eax,(%esp)
f010a290:	e8 c4 fe ff ff       	call   f010a159 <_Z10pgdir_walkPjji>
	if(ppte == NULL)
f010a295:	85 c0                	test   %eax,%eax
f010a297:	74 1a                	je     f010a2b3 <_Z11page_lookupPjjPS_+0x42>
		return NULL;
	// Set '*pte_store' to the address of the pte
	if(pte_store != NULL)
f010a299:	85 db                	test   %ebx,%ebx
f010a29b:	74 02                	je     f010a29f <_Z11page_lookupPjjPS_+0x2e>
		(*pte_store) = ppte;
f010a29d:	89 03                	mov    %eax,(%ebx)
	// Return the mapped page address
	if(*ppte & PTE_P)
f010a29f:	8b 00                	mov    (%eax),%eax
f010a2a1:	a8 01                	test   $0x1,%al
f010a2a3:	74 0e                	je     f010a2b3 <_Z11page_lookupPjjPS_+0x42>
		return &pages[PGNUM(*ppte)];
f010a2a5:	c1 e8 0c             	shr    $0xc,%eax
f010a2a8:	c1 e0 03             	shl    $0x3,%eax
f010a2ab:	03 05 48 e3 11 f0    	add    0xf011e348,%eax
f010a2b1:	eb 05                	jmp    f010a2b8 <_Z11page_lookupPjjPS_+0x47>
f010a2b3:	b8 00 00 00 00       	mov    $0x0,%eax
	return NULL;
}
f010a2b8:	83 c4 14             	add    $0x14,%esp
f010a2bb:	5b                   	pop    %ebx
f010a2bc:	5d                   	pop    %ebp
f010a2bd:	c3                   	ret    

f010a2be <_Z11page_removePjj>:
//
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
void
page_remove(pde_t *pgdir, uintptr_t va)
{
f010a2be:	55                   	push   %ebp
f010a2bf:	89 e5                	mov    %esp,%ebp
f010a2c1:	83 ec 28             	sub    $0x28,%esp
f010a2c4:	89 5d f8             	mov    %ebx,-0x8(%ebp)
f010a2c7:	89 75 fc             	mov    %esi,-0x4(%ebp)
f010a2ca:	8b 75 08             	mov    0x8(%ebp),%esi
f010a2cd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	// Fill this function in
	pte_t *ppte;
	// Lookup 'va' to identify if any physical page at that address
	struct Page *page = page_lookup(pgdir, va, &ppte);
f010a2d0:	8d 45 f4             	lea    -0xc(%ebp),%eax
f010a2d3:	89 44 24 08          	mov    %eax,0x8(%esp)
f010a2d7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010a2db:	89 34 24             	mov    %esi,(%esp)
f010a2de:	e8 8e ff ff ff       	call   f010a271 <_Z11page_lookupPjjPS_>
	// If no physical page mapped just return
	if(page == NULL)
f010a2e3:	85 c0                	test   %eax,%eax
f010a2e5:	74 1d                	je     f010a304 <_Z11page_removePjj+0x46>
		return;
	// Else decrement the ref count
	page_decref(page);
f010a2e7:	89 04 24             	mov    %eax,(%esp)
f010a2ea:	e8 be fd ff ff       	call   f010a0ad <_Z11page_decrefP4Page>
	// Set corresponding page table entry (PTE) to 0
	*ppte = 0;
f010a2ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
f010a2f2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	// Invalidated the TLB
	tlb_invalidate(pgdir, va);
f010a2f8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010a2fc:	89 34 24             	mov    %esi,(%esp)
f010a2ff:	e8 2c f9 ff ff       	call   f0109c30 <_Z14tlb_invalidatePjj>
	return;
}
f010a304:	8b 5d f8             	mov    -0x8(%ebp),%ebx
f010a307:	8b 75 fc             	mov    -0x4(%ebp),%esi
f010a30a:	89 ec                	mov    %ebp,%esp
f010a30c:	5d                   	pop    %ebp
f010a30d:	c3                   	ret    

f010a30e <_ZL16page_map_segmentPjjjji>:
// reserved portions of physical memory.
// There's no need here to manage page reference counts or invalidate the TLB.
static void
page_map_segment(pte_t *pgdir, uintptr_t la, size_t size, physaddr_t pa,
		 int perm)
{
f010a30e:	55                   	push   %ebp
f010a30f:	89 e5                	mov    %esp,%ebp
f010a311:	57                   	push   %edi
f010a312:	56                   	push   %esi
f010a313:	53                   	push   %ebx
f010a314:	83 ec 2c             	sub    $0x2c,%esp
f010a317:	89 c7                	mov    %eax,%edi
f010a319:	89 d6                	mov    %edx,%esi
	// LAB 2: Your code here.
	size_t index;
	pte_t *ppte;
	assert((la & (PGSIZE - 1)) == 0 );
f010a31b:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
f010a321:	74 24                	je     f010a347 <_ZL16page_map_segmentPjjjji+0x39>
f010a323:	c7 44 24 0c 65 db 10 	movl   $0xf010db65,0xc(%esp)
f010a32a:	f0 
f010a32b:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a332:	f0 
f010a333:	c7 44 24 04 39 02 00 	movl   $0x239,0x4(%esp)
f010a33a:	00 
f010a33b:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a342:	e8 19 ed ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	assert((pa & (PGSIZE - 1)) == 0 );
f010a347:	f7 45 08 ff 0f 00 00 	testl  $0xfff,0x8(%ebp)
f010a34e:	74 24                	je     f010a374 <_ZL16page_map_segmentPjjjji+0x66>
f010a350:	c7 44 24 0c 7e db 10 	movl   $0xf010db7e,0xc(%esp)
f010a357:	f0 
f010a358:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a35f:	f0 
f010a360:	c7 44 24 04 3a 02 00 	movl   $0x23a,0x4(%esp)
f010a367:	00 
f010a368:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a36f:	e8 ec ec ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	// Ensure size is a multiple of PGSIZE
	size = round_up(size, PGSIZE);
f010a374:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010a37b:	00 
f010a37c:	89 0c 24             	mov    %ecx,(%esp)
f010a37f:	e8 f5 15 00 00       	call   f010b979 <_Z8round_upIjET_S0_j>
f010a384:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	// Map linear address to physical
	for(index = 0; index < size; index += PGSIZE)
f010a387:	85 c0                	test   %eax,%eax
f010a389:	74 63                	je     f010a3ee <_ZL16page_map_segmentPjjjji+0xe0>
f010a38b:	bb 00 00 00 00       	mov    $0x0,%ebx
	{
		ppte = pgdir_walk(pgdir, (la + index), 1);
		assert(ppte != NULL);
		// Set permission of PTE
		(*ppte) = (pa + index) | perm | PTE_P;
f010a390:	8b 45 0c             	mov    0xc(%ebp),%eax
f010a393:	83 c8 01             	or     $0x1,%eax
f010a396:	89 45 e0             	mov    %eax,-0x20(%ebp)
	// Ensure size is a multiple of PGSIZE
	size = round_up(size, PGSIZE);
	// Map linear address to physical
	for(index = 0; index < size; index += PGSIZE)
	{
		ppte = pgdir_walk(pgdir, (la + index), 1);
f010a399:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010a3a0:	00 
f010a3a1:	8d 04 33             	lea    (%ebx,%esi,1),%eax
f010a3a4:	89 44 24 04          	mov    %eax,0x4(%esp)
f010a3a8:	89 3c 24             	mov    %edi,(%esp)
f010a3ab:	e8 a9 fd ff ff       	call   f010a159 <_Z10pgdir_walkPjji>
		assert(ppte != NULL);
f010a3b0:	85 c0                	test   %eax,%eax
f010a3b2:	75 24                	jne    f010a3d8 <_ZL16page_map_segmentPjjjji+0xca>
f010a3b4:	c7 44 24 0c 97 db 10 	movl   $0xf010db97,0xc(%esp)
f010a3bb:	f0 
f010a3bc:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a3c3:	f0 
f010a3c4:	c7 44 24 04 41 02 00 	movl   $0x241,0x4(%esp)
f010a3cb:	00 
f010a3cc:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a3d3:	e8 88 ec ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
		// Set permission of PTE
		(*ppte) = (pa + index) | perm | PTE_P;
f010a3d8:	8b 55 08             	mov    0x8(%ebp),%edx
f010a3db:	8d 14 13             	lea    (%ebx,%edx,1),%edx
f010a3de:	0b 55 e0             	or     -0x20(%ebp),%edx
f010a3e1:	89 10                	mov    %edx,(%eax)
	assert((la & (PGSIZE - 1)) == 0 );
	assert((pa & (PGSIZE - 1)) == 0 );
	// Ensure size is a multiple of PGSIZE
	size = round_up(size, PGSIZE);
	// Map linear address to physical
	for(index = 0; index < size; index += PGSIZE)
f010a3e3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f010a3e9:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
f010a3ec:	77 ab                	ja     f010a399 <_ZL16page_map_segmentPjjjji+0x8b>
		assert(ppte != NULL);
		// Set permission of PTE
		(*ppte) = (pa + index) | perm | PTE_P;
	}
	return;
}
f010a3ee:	83 c4 2c             	add    $0x2c,%esp
f010a3f1:	5b                   	pop    %ebx
f010a3f2:	5e                   	pop    %esi
f010a3f3:	5f                   	pop    %edi
f010a3f4:	5d                   	pop    %ebp
f010a3f5:	c3                   	ret    

f010a3f6 <_Z11page_insertPjP4Pageji>:
//
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and Page::physaddr.
int
page_insert(pde_t *pgdir, struct Page *pp, uintptr_t va, int perm) 
{
f010a3f6:	55                   	push   %ebp
f010a3f7:	89 e5                	mov    %esp,%ebp
f010a3f9:	83 ec 28             	sub    $0x28,%esp
f010a3fc:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010a3ff:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010a402:	89 7d fc             	mov    %edi,-0x4(%ebp)
f010a405:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010a408:	8b 7d 10             	mov    0x10(%ebp),%edi
	// Fill this function in
	pte_t *ppte = pgdir_walk(pgdir, va, 1);
f010a40b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010a412:	00 
f010a413:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010a417:	8b 45 08             	mov    0x8(%ebp),%eax
f010a41a:	89 04 24             	mov    %eax,(%esp)
f010a41d:	e8 37 fd ff ff       	call   f010a159 <_Z10pgdir_walkPjji>
f010a422:	89 c6                	mov    %eax,%esi
	// Allocate page failed
	if(ppte == NULL)
f010a424:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
f010a429:	85 f6                	test   %esi,%esi
f010a42b:	0f 84 d5 00 00 00    	je     f010a506 <_Z11page_insertPjP4Pageji+0x110>
		return -E_NO_MEM;
	if(((*ppte) & PTE_P) != 0)
f010a431:	8b 06                	mov    (%esi),%eax
f010a433:	a8 01                	test   $0x1,%al
f010a435:	74 66                	je     f010a49d <_Z11page_insertPjP4Pageji+0xa7>
	uint16_t pp_ref;

#if JOS_KERNEL
	// Returns the physical page number for this page.
	size_t page_number() const {
		assert(this >= pages && this < pages + npages);
f010a437:	8b 0d 48 e3 11 f0    	mov    0xf011e348,%ecx
f010a43d:	39 cb                	cmp    %ecx,%ebx
f010a43f:	72 0d                	jb     f010a44e <_Z11page_insertPjP4Pageji+0x58>
f010a441:	8b 15 40 e3 11 f0    	mov    0xf011e340,%edx
f010a447:	8d 14 d1             	lea    (%ecx,%edx,8),%edx
f010a44a:	39 d3                	cmp    %edx,%ebx
f010a44c:	72 24                	jb     f010a472 <_Z11page_insertPjP4Pageji+0x7c>
f010a44e:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010a455:	f0 
f010a456:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a45d:	f0 
f010a45e:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a465:	00 
f010a466:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010a46d:	e8 ee eb ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	{
		// Already page mapped, need be removed
		if(PTE_ADDR(*ppte) != pp->physaddr())
f010a472:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f010a477:	89 da                	mov    %ebx,%edx
f010a479:	29 ca                	sub    %ecx,%edx
f010a47b:	89 d1                	mov    %edx,%ecx
f010a47d:	c1 f9 03             	sar    $0x3,%ecx
f010a480:	c1 e1 0c             	shl    $0xc,%ecx
f010a483:	39 c8                	cmp    %ecx,%eax
f010a485:	74 11                	je     f010a498 <_Z11page_insertPjP4Pageji+0xa2>
		page_remove(pgdir, va);
f010a487:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010a48b:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010a48e:	89 0c 24             	mov    %ecx,(%esp)
f010a491:	e8 28 fe ff ff       	call   f010a2be <_Z11page_removePjj>
f010a496:	eb 05                	jmp    f010a49d <_Z11page_insertPjP4Pageji+0xa7>
		else
		pp->pp_ref--;
f010a498:	66 83 6b 04 01       	subw   $0x1,0x4(%ebx)
f010a49d:	a1 48 e3 11 f0       	mov    0xf011e348,%eax
f010a4a2:	39 c3                	cmp    %eax,%ebx
f010a4a4:	72 0d                	jb     f010a4b3 <_Z11page_insertPjP4Pageji+0xbd>
f010a4a6:	8b 15 40 e3 11 f0    	mov    0xf011e340,%edx
f010a4ac:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010a4af:	39 d3                	cmp    %edx,%ebx
f010a4b1:	72 24                	jb     f010a4d7 <_Z11page_insertPjP4Pageji+0xe1>
f010a4b3:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010a4ba:	f0 
f010a4bb:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a4c2:	f0 
f010a4c3:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a4ca:	00 
f010a4cb:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010a4d2:	e8 89 eb ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	}
	// Set permissions
	*ppte = pp->physaddr() | perm | PTE_P;
f010a4d7:	8b 55 14             	mov    0x14(%ebp),%edx
f010a4da:	83 ca 01             	or     $0x1,%edx
f010a4dd:	89 d9                	mov    %ebx,%ecx
f010a4df:	29 c1                	sub    %eax,%ecx
f010a4e1:	89 c8                	mov    %ecx,%eax
f010a4e3:	c1 f8 03             	sar    $0x3,%eax
f010a4e6:	c1 e0 0c             	shl    $0xc,%eax
f010a4e9:	09 d0                	or     %edx,%eax
f010a4eb:	89 06                	mov    %eax,(%esi)
	pp->pp_ref++;
f010a4ed:	66 83 43 04 01       	addw   $0x1,0x4(%ebx)
	// invalidate TLB of former page at 'va'
	tlb_invalidate(pgdir, va);
f010a4f2:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010a4f6:	8b 45 08             	mov    0x8(%ebp),%eax
f010a4f9:	89 04 24             	mov    %eax,(%esp)
f010a4fc:	e8 2f f7 ff ff       	call   f0109c30 <_Z14tlb_invalidatePjj>
f010a501:	b8 00 00 00 00       	mov    $0x0,%eax
	return 0;
}
f010a506:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010a509:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010a50c:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010a50f:	89 ec                	mov    %ebp,%esp
f010a511:	5d                   	pop    %ebp
f010a512:	c3                   	ret    

f010a513 <_Z8mem_initv>:
f010a513:	55                   	push   %ebp
f010a514:	89 e5                	mov    %esp,%ebp
f010a516:	57                   	push   %edi
f010a517:	56                   	push   %esi
f010a518:	53                   	push   %ebx
f010a519:	83 ec 3c             	sub    $0x3c,%esp
f010a51c:	e8 47 fa ff ff       	call   f0109f68 <_ZL15i386_mem_detectv>
f010a521:	a1 40 e3 11 f0       	mov    0xf011e340,%eax
f010a526:	c1 e0 03             	shl    $0x3,%eax
f010a529:	89 04 24             	mov    %eax,(%esp)
f010a52c:	e8 93 f7 ff ff       	call   f0109cc4 <_ZL10boot_allocj>
f010a531:	a3 48 e3 11 f0       	mov    %eax,0xf011e348
f010a536:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f010a53d:	e8 82 f7 ff ff       	call   f0109cc4 <_ZL10boot_allocj>
f010a542:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010a547:	77 20                	ja     f010a569 <_Z8mem_initv+0x56>
f010a549:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010a54d:	c7 44 24 08 28 d7 10 	movl   $0xf010d728,0x8(%esp)
f010a554:	f0 
f010a555:	c7 44 24 04 43 01 00 	movl   $0x143,0x4(%esp)
f010a55c:	00 
f010a55d:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a564:	e8 f7 ea ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a569:	05 00 00 00 10       	add    $0x10000000,%eax
f010a56e:	c1 e8 0c             	shr    $0xc,%eax
f010a571:	8d 58 01             	lea    0x1(%eax),%ebx
f010a574:	83 3d 40 e3 11 f0 00 	cmpl   $0x0,0xf011e340
f010a57b:	74 6e                	je     f010a5eb <_Z8mem_initv+0xd8>
f010a57d:	ba 00 00 00 00       	mov    $0x0,%edx
f010a582:	b8 00 00 00 00       	mov    $0x0,%eax
f010a587:	85 c0                	test   %eax,%eax
f010a589:	75 0e                	jne    f010a599 <_Z8mem_initv+0x86>
f010a58b:	8b 0d 48 e3 11 f0    	mov    0xf011e348,%ecx
f010a591:	66 c7 41 04 01 00    	movw   $0x1,0x4(%ecx)
f010a597:	eb 44                	jmp    f010a5dd <_Z8mem_initv+0xca>
f010a599:	3d 9f 00 00 00       	cmp    $0x9f,%eax
f010a59e:	76 13                	jbe    f010a5b3 <_Z8mem_initv+0xa0>
f010a5a0:	39 c3                	cmp    %eax,%ebx
f010a5a2:	76 0f                	jbe    f010a5b3 <_Z8mem_initv+0xa0>
f010a5a4:	8b 0d 48 e3 11 f0    	mov    0xf011e348,%ecx
f010a5aa:	66 c7 44 11 04 01 00 	movw   $0x1,0x4(%ecx,%edx,1)
f010a5b1:	eb 2a                	jmp    f010a5dd <_Z8mem_initv+0xca>
f010a5b3:	8b 0d 48 e3 11 f0    	mov    0xf011e348,%ecx
f010a5b9:	66 c7 44 11 04 00 00 	movw   $0x0,0x4(%ecx,%edx,1)
f010a5c0:	8b 35 90 e3 11 f0    	mov    0xf011e390,%esi
f010a5c6:	8b 0d 48 e3 11 f0    	mov    0xf011e348,%ecx
f010a5cc:	89 34 11             	mov    %esi,(%ecx,%edx,1)
f010a5cf:	89 d1                	mov    %edx,%ecx
f010a5d1:	03 0d 48 e3 11 f0    	add    0xf011e348,%ecx
f010a5d7:	89 0d 90 e3 11 f0    	mov    %ecx,0xf011e390
f010a5dd:	83 c0 01             	add    $0x1,%eax
f010a5e0:	83 c2 08             	add    $0x8,%edx
f010a5e3:	3b 05 40 e3 11 f0    	cmp    0xf011e340,%eax
f010a5e9:	72 9c                	jb     f010a587 <_Z8mem_initv+0x74>
f010a5eb:	8b 1d 90 e3 11 f0    	mov    0xf011e390,%ebx
f010a5f1:	85 db                	test   %ebx,%ebx
f010a5f3:	0f 84 81 00 00 00    	je     f010a67a <_Z8mem_initv+0x167>
f010a5f9:	a1 48 e3 11 f0       	mov    0xf011e348,%eax
f010a5fe:	39 c3                	cmp    %eax,%ebx
f010a600:	72 25                	jb     f010a627 <_Z8mem_initv+0x114>
f010a602:	8b 15 40 e3 11 f0    	mov    0xf011e340,%edx
f010a608:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010a60b:	39 d3                	cmp    %edx,%ebx
f010a60d:	72 3c                	jb     f010a64b <_Z8mem_initv+0x138>
f010a60f:	eb 16                	jmp    f010a627 <_Z8mem_initv+0x114>
f010a611:	a1 48 e3 11 f0       	mov    0xf011e348,%eax
f010a616:	39 c3                	cmp    %eax,%ebx
f010a618:	72 0d                	jb     f010a627 <_Z8mem_initv+0x114>
f010a61a:	8b 15 40 e3 11 f0    	mov    0xf011e340,%edx
f010a620:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010a623:	39 d3                	cmp    %edx,%ebx
f010a625:	72 24                	jb     f010a64b <_Z8mem_initv+0x138>
f010a627:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010a62e:	f0 
f010a62f:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a636:	f0 
f010a637:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a63e:	00 
f010a63f:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010a646:	e8 15 ea ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a64b:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
f010a652:	00 
f010a653:	c7 44 24 04 97 00 00 	movl   $0x97,0x4(%esp)
f010a65a:	00 
f010a65b:	89 da                	mov    %ebx,%edx
f010a65d:	29 c2                	sub    %eax,%edx
f010a65f:	89 d0                	mov    %edx,%eax
f010a661:	c1 f8 03             	sar    $0x3,%eax
f010a664:	c1 e0 0c             	shl    $0xc,%eax
f010a667:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010a66c:	89 04 24             	mov    %eax,(%esp)
f010a66f:	e8 ba 22 00 00       	call   f010c92e <_Z6memsetPvij>
f010a674:	8b 1b                	mov    (%ebx),%ebx
f010a676:	85 db                	test   %ebx,%ebx
f010a678:	75 97                	jne    f010a611 <_Z8mem_initv+0xfe>
f010a67a:	e8 51 fa ff ff       	call   f010a0d0 <_Z10page_allocv>
f010a67f:	89 c3                	mov    %eax,%ebx
f010a681:	e8 4a fa ff ff       	call   f010a0d0 <_Z10page_allocv>
f010a686:	89 c7                	mov    %eax,%edi
f010a688:	e8 43 fa ff ff       	call   f010a0d0 <_Z10page_allocv>
f010a68d:	89 c6                	mov    %eax,%esi
f010a68f:	85 db                	test   %ebx,%ebx
f010a691:	75 24                	jne    f010a6b7 <_Z8mem_initv+0x1a4>
f010a693:	c7 44 24 0c b2 db 10 	movl   $0xf010dbb2,0xc(%esp)
f010a69a:	f0 
f010a69b:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a6a2:	f0 
f010a6a3:	c7 44 24 04 5c 02 00 	movl   $0x25c,0x4(%esp)
f010a6aa:	00 
f010a6ab:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a6b2:	e8 a9 e9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a6b7:	85 ff                	test   %edi,%edi
f010a6b9:	74 04                	je     f010a6bf <_Z8mem_initv+0x1ac>
f010a6bb:	39 fb                	cmp    %edi,%ebx
f010a6bd:	75 24                	jne    f010a6e3 <_Z8mem_initv+0x1d0>
f010a6bf:	c7 44 24 0c a4 db 10 	movl   $0xf010dba4,0xc(%esp)
f010a6c6:	f0 
f010a6c7:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a6ce:	f0 
f010a6cf:	c7 44 24 04 5d 02 00 	movl   $0x25d,0x4(%esp)
f010a6d6:	00 
f010a6d7:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a6de:	e8 7d e9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a6e3:	85 c0                	test   %eax,%eax
f010a6e5:	74 0b                	je     f010a6f2 <_Z8mem_initv+0x1df>
f010a6e7:	39 c7                	cmp    %eax,%edi
f010a6e9:	74 07                	je     f010a6f2 <_Z8mem_initv+0x1df>
f010a6eb:	39 c3                	cmp    %eax,%ebx
f010a6ed:	8d 76 00             	lea    0x0(%esi),%esi
f010a6f0:	75 24                	jne    f010a716 <_Z8mem_initv+0x203>
f010a6f2:	c7 44 24 0c bc d7 10 	movl   $0xf010d7bc,0xc(%esp)
f010a6f9:	f0 
f010a6fa:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a701:	f0 
f010a702:	c7 44 24 04 5e 02 00 	movl   $0x25e,0x4(%esp)
f010a709:	00 
f010a70a:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a711:	e8 4a e9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a716:	a1 48 e3 11 f0       	mov    0xf011e348,%eax
f010a71b:	39 c3                	cmp    %eax,%ebx
f010a71d:	72 10                	jb     f010a72f <_Z8mem_initv+0x21c>
f010a71f:	8b 15 40 e3 11 f0    	mov    0xf011e340,%edx
f010a725:	8d 0c d0             	lea    (%eax,%edx,8),%ecx
f010a728:	89 4d cc             	mov    %ecx,-0x34(%ebp)
f010a72b:	39 cb                	cmp    %ecx,%ebx
f010a72d:	72 24                	jb     f010a753 <_Z8mem_initv+0x240>
f010a72f:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010a736:	f0 
f010a737:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a73e:	f0 
f010a73f:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a746:	00 
f010a747:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010a74e:	e8 0d e9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a753:	89 45 d0             	mov    %eax,-0x30(%ebp)
f010a756:	89 d9                	mov    %ebx,%ecx
f010a758:	29 c1                	sub    %eax,%ecx
f010a75a:	c1 f9 03             	sar    $0x3,%ecx
f010a75d:	39 ca                	cmp    %ecx,%edx
f010a75f:	77 24                	ja     f010a785 <_Z8mem_initv+0x272>
f010a761:	c7 44 24 0c b6 db 10 	movl   $0xf010dbb6,0xc(%esp)
f010a768:	f0 
f010a769:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a770:	f0 
f010a771:	c7 44 24 04 5f 02 00 	movl   $0x25f,0x4(%esp)
f010a778:	00 
f010a779:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a780:	e8 db e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a785:	39 c7                	cmp    %eax,%edi
f010a787:	72 05                	jb     f010a78e <_Z8mem_initv+0x27b>
f010a789:	3b 7d cc             	cmp    -0x34(%ebp),%edi
f010a78c:	72 24                	jb     f010a7b2 <_Z8mem_initv+0x29f>
f010a78e:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010a795:	f0 
f010a796:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a79d:	f0 
f010a79e:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a7a5:	00 
f010a7a6:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010a7ad:	e8 ae e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a7b2:	89 f9                	mov    %edi,%ecx
f010a7b4:	2b 4d d0             	sub    -0x30(%ebp),%ecx
f010a7b7:	c1 f9 03             	sar    $0x3,%ecx
f010a7ba:	39 ca                	cmp    %ecx,%edx
f010a7bc:	77 24                	ja     f010a7e2 <_Z8mem_initv+0x2cf>
f010a7be:	c7 44 24 0c d2 db 10 	movl   $0xf010dbd2,0xc(%esp)
f010a7c5:	f0 
f010a7c6:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a7cd:	f0 
f010a7ce:	c7 44 24 04 60 02 00 	movl   $0x260,0x4(%esp)
f010a7d5:	00 
f010a7d6:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a7dd:	e8 7e e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a7e2:	39 c6                	cmp    %eax,%esi
f010a7e4:	72 05                	jb     f010a7eb <_Z8mem_initv+0x2d8>
f010a7e6:	3b 75 cc             	cmp    -0x34(%ebp),%esi
f010a7e9:	72 24                	jb     f010a80f <_Z8mem_initv+0x2fc>
f010a7eb:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010a7f2:	f0 
f010a7f3:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a7fa:	f0 
f010a7fb:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a802:	00 
f010a803:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010a80a:	e8 51 e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a80f:	89 f0                	mov    %esi,%eax
f010a811:	2b 45 d0             	sub    -0x30(%ebp),%eax
f010a814:	c1 f8 03             	sar    $0x3,%eax
f010a817:	39 c2                	cmp    %eax,%edx
f010a819:	77 24                	ja     f010a83f <_Z8mem_initv+0x32c>
f010a81b:	c7 44 24 0c ee db 10 	movl   $0xf010dbee,0xc(%esp)
f010a822:	f0 
f010a823:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a82a:	f0 
f010a82b:	c7 44 24 04 61 02 00 	movl   $0x261,0x4(%esp)
f010a832:	00 
f010a833:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a83a:	e8 21 e8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a83f:	a1 90 e3 11 f0       	mov    0xf011e390,%eax
f010a844:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f010a847:	c7 05 90 e3 11 f0 00 	movl   $0x0,0xf011e390
f010a84e:	00 00 00 
f010a851:	e8 7a f8 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010a856:	85 c0                	test   %eax,%eax
f010a858:	74 24                	je     f010a87e <_Z8mem_initv+0x36b>
f010a85a:	c7 44 24 0c 0a dc 10 	movl   $0xf010dc0a,0xc(%esp)
f010a861:	f0 
f010a862:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a869:	f0 
f010a86a:	c7 44 24 04 69 02 00 	movl   $0x269,0x4(%esp)
f010a871:	00 
f010a872:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a879:	e8 e2 e7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a87e:	89 1c 24             	mov    %ebx,(%esp)
f010a881:	e8 84 f7 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010a886:	89 3c 24             	mov    %edi,(%esp)
f010a889:	e8 7c f7 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010a88e:	89 34 24             	mov    %esi,(%esp)
f010a891:	e8 74 f7 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010a896:	e8 35 f8 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010a89b:	89 c3                	mov    %eax,%ebx
f010a89d:	e8 2e f8 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010a8a2:	89 c7                	mov    %eax,%edi
f010a8a4:	e8 27 f8 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010a8a9:	89 c6                	mov    %eax,%esi
f010a8ab:	85 db                	test   %ebx,%ebx
f010a8ad:	75 24                	jne    f010a8d3 <_Z8mem_initv+0x3c0>
f010a8af:	c7 44 24 0c b2 db 10 	movl   $0xf010dbb2,0xc(%esp)
f010a8b6:	f0 
f010a8b7:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a8be:	f0 
f010a8bf:	c7 44 24 04 72 02 00 	movl   $0x272,0x4(%esp)
f010a8c6:	00 
f010a8c7:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a8ce:	e8 8d e7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a8d3:	85 ff                	test   %edi,%edi
f010a8d5:	74 04                	je     f010a8db <_Z8mem_initv+0x3c8>
f010a8d7:	39 fb                	cmp    %edi,%ebx
f010a8d9:	75 24                	jne    f010a8ff <_Z8mem_initv+0x3ec>
f010a8db:	c7 44 24 0c a4 db 10 	movl   $0xf010dba4,0xc(%esp)
f010a8e2:	f0 
f010a8e3:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a8ea:	f0 
f010a8eb:	c7 44 24 04 73 02 00 	movl   $0x273,0x4(%esp)
f010a8f2:	00 
f010a8f3:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a8fa:	e8 61 e7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a8ff:	85 c0                	test   %eax,%eax
f010a901:	74 08                	je     f010a90b <_Z8mem_initv+0x3f8>
f010a903:	39 c7                	cmp    %eax,%edi
f010a905:	74 04                	je     f010a90b <_Z8mem_initv+0x3f8>
f010a907:	39 c3                	cmp    %eax,%ebx
f010a909:	75 24                	jne    f010a92f <_Z8mem_initv+0x41c>
f010a90b:	c7 44 24 0c bc d7 10 	movl   $0xf010d7bc,0xc(%esp)
f010a912:	f0 
f010a913:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a91a:	f0 
f010a91b:	c7 44 24 04 74 02 00 	movl   $0x274,0x4(%esp)
f010a922:	00 
f010a923:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a92a:	e8 31 e7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a92f:	e8 9c f7 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010a934:	85 c0                	test   %eax,%eax
f010a936:	74 24                	je     f010a95c <_Z8mem_initv+0x449>
f010a938:	c7 44 24 0c 0a dc 10 	movl   $0xf010dc0a,0xc(%esp)
f010a93f:	f0 
f010a940:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a947:	f0 
f010a948:	c7 44 24 04 76 02 00 	movl   $0x276,0x4(%esp)
f010a94f:	00 
f010a950:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010a957:	e8 04 e7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a95c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
f010a95f:	89 15 90 e3 11 f0    	mov    %edx,0xf011e390
f010a965:	89 1c 24             	mov    %ebx,(%esp)
f010a968:	e8 9d f6 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010a96d:	89 3c 24             	mov    %edi,(%esp)
f010a970:	e8 95 f6 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010a975:	89 34 24             	mov    %esi,(%esp)
f010a978:	e8 8d f6 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010a97d:	c7 04 24 dc d7 10 f0 	movl   $0xf010d7dc,(%esp)
f010a984:	e8 ee 10 00 00       	call   f010ba77 <_Z7cprintfPKcz>
f010a989:	e8 42 f7 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010a98e:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
f010a993:	8b 15 48 e3 11 f0    	mov    0xf011e348,%edx
f010a999:	39 d0                	cmp    %edx,%eax
f010a99b:	72 0d                	jb     f010a9aa <_Z8mem_initv+0x497>
f010a99d:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010a9a3:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010a9a6:	39 c8                	cmp    %ecx,%eax
f010a9a8:	72 24                	jb     f010a9ce <_Z8mem_initv+0x4bb>
f010a9aa:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010a9b1:	f0 
f010a9b2:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010a9b9:	f0 
f010a9ba:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010a9c1:	00 
f010a9c2:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010a9c9:	e8 92 e6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010a9ce:	29 d0                	sub    %edx,%eax
f010a9d0:	c1 f8 03             	sar    $0x3,%eax
f010a9d3:	c1 e0 0c             	shl    $0xc,%eax
f010a9d6:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010a9db:	a3 44 e3 11 f0       	mov    %eax,0xf011e344
f010a9e0:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010a9e7:	00 
f010a9e8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010a9ef:	00 
f010a9f0:	89 04 24             	mov    %eax,(%esp)
f010a9f3:	e8 36 1f 00 00       	call   f010c92e <_Z6memsetPvij>
f010a9f8:	e8 d3 f6 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010a9fd:	89 c3                	mov    %eax,%ebx
f010a9ff:	e8 cc f6 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010aa04:	89 c7                	mov    %eax,%edi
f010aa06:	e8 c5 f6 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010aa0b:	89 c6                	mov    %eax,%esi
f010aa0d:	85 db                	test   %ebx,%ebx
f010aa0f:	75 24                	jne    f010aa35 <_Z8mem_initv+0x522>
f010aa11:	c7 44 24 0c b2 db 10 	movl   $0xf010dbb2,0xc(%esp)
f010aa18:	f0 
f010aa19:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010aa20:	f0 
f010aa21:	c7 44 24 04 b3 02 00 	movl   $0x2b3,0x4(%esp)
f010aa28:	00 
f010aa29:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010aa30:	e8 2b e6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aa35:	85 ff                	test   %edi,%edi
f010aa37:	74 04                	je     f010aa3d <_Z8mem_initv+0x52a>
f010aa39:	39 fb                	cmp    %edi,%ebx
f010aa3b:	75 24                	jne    f010aa61 <_Z8mem_initv+0x54e>
f010aa3d:	c7 44 24 0c a4 db 10 	movl   $0xf010dba4,0xc(%esp)
f010aa44:	f0 
f010aa45:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010aa4c:	f0 
f010aa4d:	c7 44 24 04 b4 02 00 	movl   $0x2b4,0x4(%esp)
f010aa54:	00 
f010aa55:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010aa5c:	e8 ff e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aa61:	85 c0                	test   %eax,%eax
f010aa63:	74 0d                	je     f010aa72 <_Z8mem_initv+0x55f>
f010aa65:	39 c7                	cmp    %eax,%edi
f010aa67:	74 09                	je     f010aa72 <_Z8mem_initv+0x55f>
f010aa69:	39 c3                	cmp    %eax,%ebx
f010aa6b:	90                   	nop
f010aa6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010aa70:	75 24                	jne    f010aa96 <_Z8mem_initv+0x583>
f010aa72:	c7 44 24 0c bc d7 10 	movl   $0xf010d7bc,0xc(%esp)
f010aa79:	f0 
f010aa7a:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010aa81:	f0 
f010aa82:	c7 44 24 04 b5 02 00 	movl   $0x2b5,0x4(%esp)
f010aa89:	00 
f010aa8a:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010aa91:	e8 ca e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aa96:	8b 0d 90 e3 11 f0    	mov    0xf011e390,%ecx
f010aa9c:	89 4d c8             	mov    %ecx,-0x38(%ebp)
f010aa9f:	c7 05 90 e3 11 f0 00 	movl   $0x0,0xf011e390
f010aaa6:	00 00 00 
f010aaa9:	e8 22 f6 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010aaae:	85 c0                	test   %eax,%eax
f010aab0:	74 24                	je     f010aad6 <_Z8mem_initv+0x5c3>
f010aab2:	c7 44 24 0c 0a dc 10 	movl   $0xf010dc0a,0xc(%esp)
f010aab9:	f0 
f010aaba:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010aac1:	f0 
f010aac2:	c7 44 24 04 bd 02 00 	movl   $0x2bd,0x4(%esp)
f010aac9:	00 
f010aaca:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010aad1:	e8 8a e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aad6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
f010aad9:	89 44 24 08          	mov    %eax,0x8(%esp)
f010aadd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010aae4:	00 
f010aae5:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010aaea:	89 04 24             	mov    %eax,(%esp)
f010aaed:	e8 7f f7 ff ff       	call   f010a271 <_Z11page_lookupPjjPS_>
f010aaf2:	85 c0                	test   %eax,%eax
f010aaf4:	74 24                	je     f010ab1a <_Z8mem_initv+0x607>
f010aaf6:	c7 44 24 0c fc d7 10 	movl   $0xf010d7fc,0xc(%esp)
f010aafd:	f0 
f010aafe:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010ab05:	f0 
f010ab06:	c7 44 24 04 c0 02 00 	movl   $0x2c0,0x4(%esp)
f010ab0d:	00 
f010ab0e:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010ab15:	e8 46 e5 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ab1a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010ab21:	00 
f010ab22:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010ab29:	00 
f010ab2a:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010ab2e:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010ab33:	89 04 24             	mov    %eax,(%esp)
f010ab36:	e8 bb f8 ff ff       	call   f010a3f6 <_Z11page_insertPjP4Pageji>
f010ab3b:	85 c0                	test   %eax,%eax
f010ab3d:	78 24                	js     f010ab63 <_Z8mem_initv+0x650>
f010ab3f:	c7 44 24 0c 28 d8 10 	movl   $0xf010d828,0xc(%esp)
f010ab46:	f0 
f010ab47:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010ab4e:	f0 
f010ab4f:	c7 44 24 04 c3 02 00 	movl   $0x2c3,0x4(%esp)
f010ab56:	00 
f010ab57:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010ab5e:	e8 fd e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ab63:	89 1c 24             	mov    %ebx,(%esp)
f010ab66:	e8 9f f4 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010ab6b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010ab72:	00 
f010ab73:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010ab7a:	00 
f010ab7b:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010ab7f:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010ab84:	89 04 24             	mov    %eax,(%esp)
f010ab87:	e8 6a f8 ff ff       	call   f010a3f6 <_Z11page_insertPjP4Pageji>
f010ab8c:	85 c0                	test   %eax,%eax
f010ab8e:	74 24                	je     f010abb4 <_Z8mem_initv+0x6a1>
f010ab90:	c7 44 24 0c 50 d8 10 	movl   $0xf010d850,0xc(%esp)
f010ab97:	f0 
f010ab98:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010ab9f:	f0 
f010aba0:	c7 44 24 04 c7 02 00 	movl   $0x2c7,0x4(%esp)
f010aba7:	00 
f010aba8:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010abaf:	e8 ac e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010abb4:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010abb9:	8b 10                	mov    (%eax),%edx
f010abbb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
f010abbe:	8b 0d 48 e3 11 f0    	mov    0xf011e348,%ecx
f010abc4:	89 4d cc             	mov    %ecx,-0x34(%ebp)
f010abc7:	39 cb                	cmp    %ecx,%ebx
f010abc9:	72 10                	jb     f010abdb <_Z8mem_initv+0x6c8>
f010abcb:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010abd1:	8b 55 cc             	mov    -0x34(%ebp),%edx
f010abd4:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010abd7:	39 cb                	cmp    %ecx,%ebx
f010abd9:	72 24                	jb     f010abff <_Z8mem_initv+0x6ec>
f010abdb:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010abe2:	f0 
f010abe3:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010abea:	f0 
f010abeb:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010abf2:	00 
f010abf3:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010abfa:	e8 61 e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010abff:	89 5d d0             	mov    %ebx,-0x30(%ebp)
f010ac02:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010ac05:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
f010ac0b:	89 da                	mov    %ebx,%edx
f010ac0d:	2b 55 cc             	sub    -0x34(%ebp),%edx
f010ac10:	89 55 d4             	mov    %edx,-0x2c(%ebp)
f010ac13:	c1 fa 03             	sar    $0x3,%edx
f010ac16:	c1 e2 0c             	shl    $0xc,%edx
f010ac19:	39 d1                	cmp    %edx,%ecx
f010ac1b:	74 24                	je     f010ac41 <_Z8mem_initv+0x72e>
f010ac1d:	c7 44 24 0c 78 d8 10 	movl   $0xf010d878,0xc(%esp)
f010ac24:	f0 
f010ac25:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010ac2c:	f0 
f010ac2d:	c7 44 24 04 c8 02 00 	movl   $0x2c8,0x4(%esp)
f010ac34:	00 
f010ac35:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010ac3c:	e8 1f e4 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ac41:	ba 00 00 00 00       	mov    $0x0,%edx
f010ac46:	e8 ed f0 ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f010ac4b:	8b 15 48 e3 11 f0    	mov    0xf011e348,%edx
f010ac51:	39 d7                	cmp    %edx,%edi
f010ac53:	72 0d                	jb     f010ac62 <_Z8mem_initv+0x74f>
f010ac55:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010ac5b:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010ac5e:	39 cf                	cmp    %ecx,%edi
f010ac60:	72 24                	jb     f010ac86 <_Z8mem_initv+0x773>
f010ac62:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010ac69:	f0 
f010ac6a:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010ac71:	f0 
f010ac72:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010ac79:	00 
f010ac7a:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010ac81:	e8 da e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ac86:	89 7d d4             	mov    %edi,-0x2c(%ebp)
f010ac89:	89 f9                	mov    %edi,%ecx
f010ac8b:	29 d1                	sub    %edx,%ecx
f010ac8d:	89 ca                	mov    %ecx,%edx
f010ac8f:	c1 fa 03             	sar    $0x3,%edx
f010ac92:	c1 e2 0c             	shl    $0xc,%edx
f010ac95:	39 d0                	cmp    %edx,%eax
f010ac97:	74 24                	je     f010acbd <_Z8mem_initv+0x7aa>
f010ac99:	c7 44 24 0c a4 d8 10 	movl   $0xf010d8a4,0xc(%esp)
f010aca0:	f0 
f010aca1:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010aca8:	f0 
f010aca9:	c7 44 24 04 c9 02 00 	movl   $0x2c9,0x4(%esp)
f010acb0:	00 
f010acb1:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010acb8:	e8 a3 e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010acbd:	66 83 7f 04 01       	cmpw   $0x1,0x4(%edi)
f010acc2:	74 24                	je     f010ace8 <_Z8mem_initv+0x7d5>
f010acc4:	c7 44 24 0c 15 dc 10 	movl   $0xf010dc15,0xc(%esp)
f010accb:	f0 
f010accc:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010acd3:	f0 
f010acd4:	c7 44 24 04 ca 02 00 	movl   $0x2ca,0x4(%esp)
f010acdb:	00 
f010acdc:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010ace3:	e8 78 e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ace8:	66 83 7b 04 01       	cmpw   $0x1,0x4(%ebx)
f010aced:	74 24                	je     f010ad13 <_Z8mem_initv+0x800>
f010acef:	c7 44 24 0c 26 dc 10 	movl   $0xf010dc26,0xc(%esp)
f010acf6:	f0 
f010acf7:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010acfe:	f0 
f010acff:	c7 44 24 04 cb 02 00 	movl   $0x2cb,0x4(%esp)
f010ad06:	00 
f010ad07:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010ad0e:	e8 4d e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ad13:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010ad1a:	00 
f010ad1b:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010ad22:	00 
f010ad23:	89 74 24 04          	mov    %esi,0x4(%esp)
f010ad27:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010ad2c:	89 04 24             	mov    %eax,(%esp)
f010ad2f:	e8 c2 f6 ff ff       	call   f010a3f6 <_Z11page_insertPjP4Pageji>
f010ad34:	85 c0                	test   %eax,%eax
f010ad36:	74 24                	je     f010ad5c <_Z8mem_initv+0x849>
f010ad38:	c7 44 24 0c d4 d8 10 	movl   $0xf010d8d4,0xc(%esp)
f010ad3f:	f0 
f010ad40:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010ad47:	f0 
f010ad48:	c7 44 24 04 cf 02 00 	movl   $0x2cf,0x4(%esp)
f010ad4f:	00 
f010ad50:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010ad57:	e8 04 e3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ad5c:	ba 00 10 00 00       	mov    $0x1000,%edx
f010ad61:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010ad66:	e8 cd ef ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f010ad6b:	8b 15 48 e3 11 f0    	mov    0xf011e348,%edx
f010ad71:	39 d6                	cmp    %edx,%esi
f010ad73:	72 0d                	jb     f010ad82 <_Z8mem_initv+0x86f>
f010ad75:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010ad7b:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010ad7e:	39 ce                	cmp    %ecx,%esi
f010ad80:	72 24                	jb     f010ada6 <_Z8mem_initv+0x893>
f010ad82:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010ad89:	f0 
f010ad8a:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010ad91:	f0 
f010ad92:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010ad99:	00 
f010ad9a:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010ada1:	e8 ba e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ada6:	89 75 cc             	mov    %esi,-0x34(%ebp)
f010ada9:	89 f1                	mov    %esi,%ecx
f010adab:	29 d1                	sub    %edx,%ecx
f010adad:	89 ca                	mov    %ecx,%edx
f010adaf:	c1 fa 03             	sar    $0x3,%edx
f010adb2:	c1 e2 0c             	shl    $0xc,%edx
f010adb5:	39 d0                	cmp    %edx,%eax
f010adb7:	74 24                	je     f010addd <_Z8mem_initv+0x8ca>
f010adb9:	c7 44 24 0c 04 d9 10 	movl   $0xf010d904,0xc(%esp)
f010adc0:	f0 
f010adc1:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010adc8:	f0 
f010adc9:	c7 44 24 04 d0 02 00 	movl   $0x2d0,0x4(%esp)
f010add0:	00 
f010add1:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010add8:	e8 83 e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010addd:	66 83 7e 04 01       	cmpw   $0x1,0x4(%esi)
f010ade2:	74 24                	je     f010ae08 <_Z8mem_initv+0x8f5>
f010ade4:	c7 44 24 0c 37 dc 10 	movl   $0xf010dc37,0xc(%esp)
f010adeb:	f0 
f010adec:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010adf3:	f0 
f010adf4:	c7 44 24 04 d1 02 00 	movl   $0x2d1,0x4(%esp)
f010adfb:	00 
f010adfc:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010ae03:	e8 58 e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ae08:	e8 c3 f2 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010ae0d:	85 c0                	test   %eax,%eax
f010ae0f:	74 24                	je     f010ae35 <_Z8mem_initv+0x922>
f010ae11:	c7 44 24 0c 0a dc 10 	movl   $0xf010dc0a,0xc(%esp)
f010ae18:	f0 
f010ae19:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010ae20:	f0 
f010ae21:	c7 44 24 04 d5 02 00 	movl   $0x2d5,0x4(%esp)
f010ae28:	00 
f010ae29:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010ae30:	e8 2b e2 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ae35:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010ae3c:	00 
f010ae3d:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010ae44:	00 
f010ae45:	89 74 24 04          	mov    %esi,0x4(%esp)
f010ae49:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010ae4e:	89 04 24             	mov    %eax,(%esp)
f010ae51:	e8 a0 f5 ff ff       	call   f010a3f6 <_Z11page_insertPjP4Pageji>
f010ae56:	85 c0                	test   %eax,%eax
f010ae58:	74 24                	je     f010ae7e <_Z8mem_initv+0x96b>
f010ae5a:	c7 44 24 0c d4 d8 10 	movl   $0xf010d8d4,0xc(%esp)
f010ae61:	f0 
f010ae62:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010ae69:	f0 
f010ae6a:	c7 44 24 04 d8 02 00 	movl   $0x2d8,0x4(%esp)
f010ae71:	00 
f010ae72:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010ae79:	e8 e2 e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ae7e:	ba 00 10 00 00       	mov    $0x1000,%edx
f010ae83:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010ae88:	e8 ab ee ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f010ae8d:	8b 15 48 e3 11 f0    	mov    0xf011e348,%edx
f010ae93:	39 d6                	cmp    %edx,%esi
f010ae95:	72 0d                	jb     f010aea4 <_Z8mem_initv+0x991>
f010ae97:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010ae9d:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010aea0:	39 ce                	cmp    %ecx,%esi
f010aea2:	72 24                	jb     f010aec8 <_Z8mem_initv+0x9b5>
f010aea4:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010aeab:	f0 
f010aeac:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010aeb3:	f0 
f010aeb4:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010aebb:	00 
f010aebc:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010aec3:	e8 98 e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aec8:	8b 4d cc             	mov    -0x34(%ebp),%ecx
f010aecb:	29 d1                	sub    %edx,%ecx
f010aecd:	89 ca                	mov    %ecx,%edx
f010aecf:	c1 fa 03             	sar    $0x3,%edx
f010aed2:	c1 e2 0c             	shl    $0xc,%edx
f010aed5:	39 d0                	cmp    %edx,%eax
f010aed7:	74 24                	je     f010aefd <_Z8mem_initv+0x9ea>
f010aed9:	c7 44 24 0c 04 d9 10 	movl   $0xf010d904,0xc(%esp)
f010aee0:	f0 
f010aee1:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010aee8:	f0 
f010aee9:	c7 44 24 04 d9 02 00 	movl   $0x2d9,0x4(%esp)
f010aef0:	00 
f010aef1:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010aef8:	e8 63 e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010aefd:	66 83 7e 04 01       	cmpw   $0x1,0x4(%esi)
f010af02:	74 24                	je     f010af28 <_Z8mem_initv+0xa15>
f010af04:	c7 44 24 0c 37 dc 10 	movl   $0xf010dc37,0xc(%esp)
f010af0b:	f0 
f010af0c:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010af13:	f0 
f010af14:	c7 44 24 04 da 02 00 	movl   $0x2da,0x4(%esp)
f010af1b:	00 
f010af1c:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010af23:	e8 38 e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010af28:	e8 a3 f1 ff ff       	call   f010a0d0 <_Z10page_allocv>
f010af2d:	85 c0                	test   %eax,%eax
f010af2f:	74 24                	je     f010af55 <_Z8mem_initv+0xa42>
f010af31:	c7 44 24 0c 0a dc 10 	movl   $0xf010dc0a,0xc(%esp)
f010af38:	f0 
f010af39:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010af40:	f0 
f010af41:	c7 44 24 04 df 02 00 	movl   $0x2df,0x4(%esp)
f010af48:	00 
f010af49:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010af50:	e8 0b e1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010af55:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010af5a:	8b 00                	mov    (%eax),%eax
f010af5c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f010af61:	89 c2                	mov    %eax,%edx
f010af63:	c1 ea 0c             	shr    $0xc,%edx
f010af66:	3b 15 40 e3 11 f0    	cmp    0xf011e340,%edx
f010af6c:	72 20                	jb     f010af8e <_Z8mem_initv+0xa7b>
f010af6e:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010af72:	c7 44 24 08 d8 d6 10 	movl   $0xf010d6d8,0x8(%esp)
f010af79:	f0 
f010af7a:	c7 44 24 04 e2 02 00 	movl   $0x2e2,0x4(%esp)
f010af81:	00 
f010af82:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010af89:	e8 d2 e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010af8e:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010af93:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010af96:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010af9d:	00 
f010af9e:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010afa5:	00 
f010afa6:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010afab:	89 04 24             	mov    %eax,(%esp)
f010afae:	e8 a6 f1 ff ff       	call   f010a159 <_Z10pgdir_walkPjji>
f010afb3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010afb6:	83 c2 04             	add    $0x4,%edx
f010afb9:	39 d0                	cmp    %edx,%eax
f010afbb:	74 24                	je     f010afe1 <_Z8mem_initv+0xace>
f010afbd:	c7 44 24 0c 38 d9 10 	movl   $0xf010d938,0xc(%esp)
f010afc4:	f0 
f010afc5:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010afcc:	f0 
f010afcd:	c7 44 24 04 e3 02 00 	movl   $0x2e3,0x4(%esp)
f010afd4:	00 
f010afd5:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010afdc:	e8 7f e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010afe1:	c7 44 24 0c 04 00 00 	movl   $0x4,0xc(%esp)
f010afe8:	00 
f010afe9:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010aff0:	00 
f010aff1:	89 74 24 04          	mov    %esi,0x4(%esp)
f010aff5:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010affa:	89 04 24             	mov    %eax,(%esp)
f010affd:	e8 f4 f3 ff ff       	call   f010a3f6 <_Z11page_insertPjP4Pageji>
f010b002:	85 c0                	test   %eax,%eax
f010b004:	74 24                	je     f010b02a <_Z8mem_initv+0xb17>
f010b006:	c7 44 24 0c 70 d9 10 	movl   $0xf010d970,0xc(%esp)
f010b00d:	f0 
f010b00e:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b015:	f0 
f010b016:	c7 44 24 04 e6 02 00 	movl   $0x2e6,0x4(%esp)
f010b01d:	00 
f010b01e:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b025:	e8 36 e0 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b02a:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b02f:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b034:	e8 ff ec ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f010b039:	8b 15 48 e3 11 f0    	mov    0xf011e348,%edx
f010b03f:	39 d6                	cmp    %edx,%esi
f010b041:	72 0d                	jb     f010b050 <_Z8mem_initv+0xb3d>
f010b043:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010b049:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010b04c:	39 ce                	cmp    %ecx,%esi
f010b04e:	72 24                	jb     f010b074 <_Z8mem_initv+0xb61>
f010b050:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010b057:	f0 
f010b058:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b05f:	f0 
f010b060:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b067:	00 
f010b068:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010b06f:	e8 ec df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b074:	8b 4d cc             	mov    -0x34(%ebp),%ecx
f010b077:	29 d1                	sub    %edx,%ecx
f010b079:	89 ca                	mov    %ecx,%edx
f010b07b:	c1 fa 03             	sar    $0x3,%edx
f010b07e:	c1 e2 0c             	shl    $0xc,%edx
f010b081:	39 d0                	cmp    %edx,%eax
f010b083:	74 24                	je     f010b0a9 <_Z8mem_initv+0xb96>
f010b085:	c7 44 24 0c 04 d9 10 	movl   $0xf010d904,0xc(%esp)
f010b08c:	f0 
f010b08d:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b094:	f0 
f010b095:	c7 44 24 04 e7 02 00 	movl   $0x2e7,0x4(%esp)
f010b09c:	00 
f010b09d:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b0a4:	e8 b7 df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b0a9:	66 83 7e 04 01       	cmpw   $0x1,0x4(%esi)
f010b0ae:	74 24                	je     f010b0d4 <_Z8mem_initv+0xbc1>
f010b0b0:	c7 44 24 0c 37 dc 10 	movl   $0xf010dc37,0xc(%esp)
f010b0b7:	f0 
f010b0b8:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b0bf:	f0 
f010b0c0:	c7 44 24 04 e8 02 00 	movl   $0x2e8,0x4(%esp)
f010b0c7:	00 
f010b0c8:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b0cf:	e8 8c df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b0d4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
f010b0db:	00 
f010b0dc:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010b0e3:	00 
f010b0e4:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b0e9:	89 04 24             	mov    %eax,(%esp)
f010b0ec:	e8 68 f0 ff ff       	call   f010a159 <_Z10pgdir_walkPjji>
f010b0f1:	f6 00 04             	testb  $0x4,(%eax)
f010b0f4:	75 24                	jne    f010b11a <_Z8mem_initv+0xc07>
f010b0f6:	c7 44 24 0c a4 d9 10 	movl   $0xf010d9a4,0xc(%esp)
f010b0fd:	f0 
f010b0fe:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b105:	f0 
f010b106:	c7 44 24 04 e9 02 00 	movl   $0x2e9,0x4(%esp)
f010b10d:	00 
f010b10e:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b115:	e8 46 df ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b11a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010b121:	00 
f010b122:	c7 44 24 08 00 00 40 	movl   $0x400000,0x8(%esp)
f010b129:	00 
f010b12a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010b12e:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b133:	89 04 24             	mov    %eax,(%esp)
f010b136:	e8 bb f2 ff ff       	call   f010a3f6 <_Z11page_insertPjP4Pageji>
f010b13b:	85 c0                	test   %eax,%eax
f010b13d:	78 24                	js     f010b163 <_Z8mem_initv+0xc50>
f010b13f:	c7 44 24 0c d0 d9 10 	movl   $0xf010d9d0,0xc(%esp)
f010b146:	f0 
f010b147:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b14e:	f0 
f010b14f:	c7 44 24 04 ed 02 00 	movl   $0x2ed,0x4(%esp)
f010b156:	00 
f010b157:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b15e:	e8 fd de ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b163:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010b16a:	00 
f010b16b:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010b172:	00 
f010b173:	89 7c 24 04          	mov    %edi,0x4(%esp)
f010b177:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b17c:	89 04 24             	mov    %eax,(%esp)
f010b17f:	e8 72 f2 ff ff       	call   f010a3f6 <_Z11page_insertPjP4Pageji>
f010b184:	85 c0                	test   %eax,%eax
f010b186:	74 24                	je     f010b1ac <_Z8mem_initv+0xc99>
f010b188:	c7 44 24 0c fc d9 10 	movl   $0xf010d9fc,0xc(%esp)
f010b18f:	f0 
f010b190:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b197:	f0 
f010b198:	c7 44 24 04 f0 02 00 	movl   $0x2f0,0x4(%esp)
f010b19f:	00 
f010b1a0:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b1a7:	e8 b4 de ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b1ac:	ba 00 00 00 00       	mov    $0x0,%edx
f010b1b1:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b1b6:	e8 7d eb ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f010b1bb:	8b 15 48 e3 11 f0    	mov    0xf011e348,%edx
f010b1c1:	39 d7                	cmp    %edx,%edi
f010b1c3:	72 0d                	jb     f010b1d2 <_Z8mem_initv+0xcbf>
f010b1c5:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010b1cb:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010b1ce:	39 cf                	cmp    %ecx,%edi
f010b1d0:	72 24                	jb     f010b1f6 <_Z8mem_initv+0xce3>
f010b1d2:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010b1d9:	f0 
f010b1da:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b1e1:	f0 
f010b1e2:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b1e9:	00 
f010b1ea:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010b1f1:	e8 6a de ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b1f6:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010b1f9:	29 d1                	sub    %edx,%ecx
f010b1fb:	89 ca                	mov    %ecx,%edx
f010b1fd:	c1 fa 03             	sar    $0x3,%edx
f010b200:	c1 e2 0c             	shl    $0xc,%edx
f010b203:	39 d0                	cmp    %edx,%eax
f010b205:	74 24                	je     f010b22b <_Z8mem_initv+0xd18>
f010b207:	c7 44 24 0c a4 d8 10 	movl   $0xf010d8a4,0xc(%esp)
f010b20e:	f0 
f010b20f:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b216:	f0 
f010b217:	c7 44 24 04 f3 02 00 	movl   $0x2f3,0x4(%esp)
f010b21e:	00 
f010b21f:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b226:	e8 35 de ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b22b:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b230:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b235:	e8 fe ea ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f010b23a:	8b 15 48 e3 11 f0    	mov    0xf011e348,%edx
f010b240:	39 d7                	cmp    %edx,%edi
f010b242:	72 0d                	jb     f010b251 <_Z8mem_initv+0xd3e>
f010b244:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010b24a:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010b24d:	39 cf                	cmp    %ecx,%edi
f010b24f:	72 24                	jb     f010b275 <_Z8mem_initv+0xd62>
f010b251:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010b258:	f0 
f010b259:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b260:	f0 
f010b261:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b268:	00 
f010b269:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010b270:	e8 eb dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b275:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010b278:	29 d1                	sub    %edx,%ecx
f010b27a:	89 ca                	mov    %ecx,%edx
f010b27c:	c1 fa 03             	sar    $0x3,%edx
f010b27f:	c1 e2 0c             	shl    $0xc,%edx
f010b282:	39 d0                	cmp    %edx,%eax
f010b284:	74 24                	je     f010b2aa <_Z8mem_initv+0xd97>
f010b286:	c7 44 24 0c 2c da 10 	movl   $0xf010da2c,0xc(%esp)
f010b28d:	f0 
f010b28e:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b295:	f0 
f010b296:	c7 44 24 04 f4 02 00 	movl   $0x2f4,0x4(%esp)
f010b29d:	00 
f010b29e:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b2a5:	e8 b6 dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b2aa:	66 83 7f 04 02       	cmpw   $0x2,0x4(%edi)
f010b2af:	74 24                	je     f010b2d5 <_Z8mem_initv+0xdc2>
f010b2b1:	c7 44 24 0c 48 dc 10 	movl   $0xf010dc48,0xc(%esp)
f010b2b8:	f0 
f010b2b9:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b2c0:	f0 
f010b2c1:	c7 44 24 04 f6 02 00 	movl   $0x2f6,0x4(%esp)
f010b2c8:	00 
f010b2c9:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b2d0:	e8 8b dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b2d5:	66 83 7e 04 00       	cmpw   $0x0,0x4(%esi)
f010b2da:	74 24                	je     f010b300 <_Z8mem_initv+0xded>
f010b2dc:	c7 44 24 0c 59 dc 10 	movl   $0xf010dc59,0xc(%esp)
f010b2e3:	f0 
f010b2e4:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b2eb:	f0 
f010b2ec:	c7 44 24 04 f7 02 00 	movl   $0x2f7,0x4(%esp)
f010b2f3:	00 
f010b2f4:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b2fb:	e8 60 dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b300:	e8 cb ed ff ff       	call   f010a0d0 <_Z10page_allocv>
f010b305:	39 c6                	cmp    %eax,%esi
f010b307:	74 24                	je     f010b32d <_Z8mem_initv+0xe1a>
f010b309:	c7 44 24 0c 6a dc 10 	movl   $0xf010dc6a,0xc(%esp)
f010b310:	f0 
f010b311:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b318:	f0 
f010b319:	c7 44 24 04 fb 02 00 	movl   $0x2fb,0x4(%esp)
f010b320:	00 
f010b321:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b328:	e8 33 dd ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b32d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010b334:	00 
f010b335:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b33a:	89 04 24             	mov    %eax,(%esp)
f010b33d:	e8 7c ef ff ff       	call   f010a2be <_Z11page_removePjj>
f010b342:	ba 00 00 00 00       	mov    $0x0,%edx
f010b347:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b34c:	e8 e7 e9 ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f010b351:	83 f8 ff             	cmp    $0xffffffff,%eax
f010b354:	74 24                	je     f010b37a <_Z8mem_initv+0xe67>
f010b356:	c7 44 24 0c 60 da 10 	movl   $0xf010da60,0xc(%esp)
f010b35d:	f0 
f010b35e:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b365:	f0 
f010b366:	c7 44 24 04 ff 02 00 	movl   $0x2ff,0x4(%esp)
f010b36d:	00 
f010b36e:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b375:	e8 e6 dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b37a:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b37f:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b384:	e8 af e9 ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f010b389:	8b 15 48 e3 11 f0    	mov    0xf011e348,%edx
f010b38f:	39 d7                	cmp    %edx,%edi
f010b391:	72 0d                	jb     f010b3a0 <_Z8mem_initv+0xe8d>
f010b393:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010b399:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
f010b39c:	39 cf                	cmp    %ecx,%edi
f010b39e:	72 24                	jb     f010b3c4 <_Z8mem_initv+0xeb1>
f010b3a0:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010b3a7:	f0 
f010b3a8:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b3af:	f0 
f010b3b0:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b3b7:	00 
f010b3b8:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010b3bf:	e8 9c dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b3c4:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010b3c7:	29 d1                	sub    %edx,%ecx
f010b3c9:	89 ca                	mov    %ecx,%edx
f010b3cb:	c1 fa 03             	sar    $0x3,%edx
f010b3ce:	c1 e2 0c             	shl    $0xc,%edx
f010b3d1:	39 d0                	cmp    %edx,%eax
f010b3d3:	74 24                	je     f010b3f9 <_Z8mem_initv+0xee6>
f010b3d5:	c7 44 24 0c 2c da 10 	movl   $0xf010da2c,0xc(%esp)
f010b3dc:	f0 
f010b3dd:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b3e4:	f0 
f010b3e5:	c7 44 24 04 00 03 00 	movl   $0x300,0x4(%esp)
f010b3ec:	00 
f010b3ed:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b3f4:	e8 67 dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b3f9:	66 83 7f 04 01       	cmpw   $0x1,0x4(%edi)
f010b3fe:	74 24                	je     f010b424 <_Z8mem_initv+0xf11>
f010b400:	c7 44 24 0c 15 dc 10 	movl   $0xf010dc15,0xc(%esp)
f010b407:	f0 
f010b408:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b40f:	f0 
f010b410:	c7 44 24 04 01 03 00 	movl   $0x301,0x4(%esp)
f010b417:	00 
f010b418:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b41f:	e8 3c dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b424:	66 83 7e 04 00       	cmpw   $0x0,0x4(%esi)
f010b429:	74 24                	je     f010b44f <_Z8mem_initv+0xf3c>
f010b42b:	c7 44 24 0c 59 dc 10 	movl   $0xf010dc59,0xc(%esp)
f010b432:	f0 
f010b433:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b43a:	f0 
f010b43b:	c7 44 24 04 02 03 00 	movl   $0x302,0x4(%esp)
f010b442:	00 
f010b443:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b44a:	e8 11 dc ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b44f:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
f010b456:	00 
f010b457:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b45c:	89 04 24             	mov    %eax,(%esp)
f010b45f:	e8 5a ee ff ff       	call   f010a2be <_Z11page_removePjj>
f010b464:	ba 00 00 00 00       	mov    $0x0,%edx
f010b469:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b46e:	e8 c5 e8 ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f010b473:	83 f8 ff             	cmp    $0xffffffff,%eax
f010b476:	74 24                	je     f010b49c <_Z8mem_initv+0xf89>
f010b478:	c7 44 24 0c 60 da 10 	movl   $0xf010da60,0xc(%esp)
f010b47f:	f0 
f010b480:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b487:	f0 
f010b488:	c7 44 24 04 06 03 00 	movl   $0x306,0x4(%esp)
f010b48f:	00 
f010b490:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b497:	e8 c4 db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b49c:	ba 00 10 00 00       	mov    $0x1000,%edx
f010b4a1:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b4a6:	e8 8d e8 ff ff       	call   f0109d38 <_ZL11check_va2paPjj>
f010b4ab:	83 f8 ff             	cmp    $0xffffffff,%eax
f010b4ae:	74 24                	je     f010b4d4 <_Z8mem_initv+0xfc1>
f010b4b0:	c7 44 24 0c 84 da 10 	movl   $0xf010da84,0xc(%esp)
f010b4b7:	f0 
f010b4b8:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b4bf:	f0 
f010b4c0:	c7 44 24 04 07 03 00 	movl   $0x307,0x4(%esp)
f010b4c7:	00 
f010b4c8:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b4cf:	e8 8c db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b4d4:	66 83 7f 04 00       	cmpw   $0x0,0x4(%edi)
f010b4d9:	74 24                	je     f010b4ff <_Z8mem_initv+0xfec>
f010b4db:	c7 44 24 0c 74 dc 10 	movl   $0xf010dc74,0xc(%esp)
f010b4e2:	f0 
f010b4e3:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b4ea:	f0 
f010b4eb:	c7 44 24 04 08 03 00 	movl   $0x308,0x4(%esp)
f010b4f2:	00 
f010b4f3:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b4fa:	e8 61 db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b4ff:	66 83 7e 04 00       	cmpw   $0x0,0x4(%esi)
f010b504:	74 24                	je     f010b52a <_Z8mem_initv+0x1017>
f010b506:	c7 44 24 0c 59 dc 10 	movl   $0xf010dc59,0xc(%esp)
f010b50d:	f0 
f010b50e:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b515:	f0 
f010b516:	c7 44 24 04 09 03 00 	movl   $0x309,0x4(%esp)
f010b51d:	00 
f010b51e:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b525:	e8 36 db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b52a:	e8 a1 eb ff ff       	call   f010a0d0 <_Z10page_allocv>
f010b52f:	39 c7                	cmp    %eax,%edi
f010b531:	74 24                	je     f010b557 <_Z8mem_initv+0x1044>
f010b533:	c7 44 24 0c 85 dc 10 	movl   $0xf010dc85,0xc(%esp)
f010b53a:	f0 
f010b53b:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b542:	f0 
f010b543:	c7 44 24 04 0d 03 00 	movl   $0x30d,0x4(%esp)
f010b54a:	00 
f010b54b:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b552:	e8 09 db ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b557:	e8 74 eb ff ff       	call   f010a0d0 <_Z10page_allocv>
f010b55c:	85 c0                	test   %eax,%eax
f010b55e:	74 24                	je     f010b584 <_Z8mem_initv+0x1071>
f010b560:	c7 44 24 0c 0a dc 10 	movl   $0xf010dc0a,0xc(%esp)
f010b567:	f0 
f010b568:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b56f:	f0 
f010b570:	c7 44 24 04 11 03 00 	movl   $0x311,0x4(%esp)
f010b577:	00 
f010b578:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b57f:	e8 dc da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b584:	8b 15 44 e3 11 f0    	mov    0xf011e344,%edx
f010b58a:	8b 02                	mov    (%edx),%eax
f010b58c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f010b58f:	8b 0d 48 e3 11 f0    	mov    0xf011e348,%ecx
f010b595:	89 4d cc             	mov    %ecx,-0x34(%ebp)
f010b598:	39 cb                	cmp    %ecx,%ebx
f010b59a:	72 10                	jb     f010b5ac <_Z8mem_initv+0x1099>
f010b59c:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010b5a2:	8b 45 cc             	mov    -0x34(%ebp),%eax
f010b5a5:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
f010b5a8:	39 cb                	cmp    %ecx,%ebx
f010b5aa:	72 24                	jb     f010b5d0 <_Z8mem_initv+0x10bd>
f010b5ac:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010b5b3:	f0 
f010b5b4:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b5bb:	f0 
f010b5bc:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b5c3:	00 
f010b5c4:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010b5cb:	e8 90 da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b5d0:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010b5d3:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
f010b5d9:	8b 45 d0             	mov    -0x30(%ebp),%eax
f010b5dc:	2b 45 cc             	sub    -0x34(%ebp),%eax
f010b5df:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f010b5e2:	c1 f8 03             	sar    $0x3,%eax
f010b5e5:	c1 e0 0c             	shl    $0xc,%eax
f010b5e8:	39 c1                	cmp    %eax,%ecx
f010b5ea:	74 24                	je     f010b610 <_Z8mem_initv+0x10fd>
f010b5ec:	c7 44 24 0c 78 d8 10 	movl   $0xf010d878,0xc(%esp)
f010b5f3:	f0 
f010b5f4:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b5fb:	f0 
f010b5fc:	c7 44 24 04 1e 03 00 	movl   $0x31e,0x4(%esp)
f010b603:	00 
f010b604:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b60b:	e8 50 da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b610:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
f010b616:	66 83 7b 04 01       	cmpw   $0x1,0x4(%ebx)
f010b61b:	74 24                	je     f010b641 <_Z8mem_initv+0x112e>
f010b61d:	c7 44 24 0c 26 dc 10 	movl   $0xf010dc26,0xc(%esp)
f010b624:	f0 
f010b625:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b62c:	f0 
f010b62d:	c7 44 24 04 20 03 00 	movl   $0x320,0x4(%esp)
f010b634:	00 
f010b635:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b63c:	e8 1f da ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b641:	66 c7 43 04 00 00    	movw   $0x0,0x4(%ebx)
f010b647:	89 1c 24             	mov    %ebx,(%esp)
f010b64a:	e8 bb e9 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010b64f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010b656:	00 
f010b657:	c7 44 24 04 00 10 40 	movl   $0x401000,0x4(%esp)
f010b65e:	00 
f010b65f:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b664:	89 04 24             	mov    %eax,(%esp)
f010b667:	e8 ed ea ff ff       	call   f010a159 <_Z10pgdir_walkPjji>
f010b66c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010b66f:	8b 0d 44 e3 11 f0    	mov    0xf011e344,%ecx
f010b675:	83 c1 04             	add    $0x4,%ecx
f010b678:	8b 11                	mov    (%ecx),%edx
f010b67a:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
f010b680:	89 55 cc             	mov    %edx,-0x34(%ebp)
f010b683:	c1 ea 0c             	shr    $0xc,%edx
f010b686:	3b 15 40 e3 11 f0    	cmp    0xf011e340,%edx
f010b68c:	72 23                	jb     f010b6b1 <_Z8mem_initv+0x119e>
f010b68e:	8b 55 cc             	mov    -0x34(%ebp),%edx
f010b691:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010b695:	c7 44 24 08 d8 d6 10 	movl   $0xf010d6d8,0x8(%esp)
f010b69c:	f0 
f010b69d:	c7 44 24 04 27 03 00 	movl   $0x327,0x4(%esp)
f010b6a4:	00 
f010b6a5:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b6ac:	e8 af d9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b6b1:	8b 55 cc             	mov    -0x34(%ebp),%edx
f010b6b4:	81 ea fc ff ff 0f    	sub    $0xffffffc,%edx
f010b6ba:	39 d0                	cmp    %edx,%eax
f010b6bc:	74 24                	je     f010b6e2 <_Z8mem_initv+0x11cf>
f010b6be:	c7 44 24 0c 8f dc 10 	movl   $0xf010dc8f,0xc(%esp)
f010b6c5:	f0 
f010b6c6:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b6cd:	f0 
f010b6ce:	c7 44 24 04 28 03 00 	movl   $0x328,0x4(%esp)
f010b6d5:	00 
f010b6d6:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b6dd:	e8 7e d9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b6e2:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
f010b6e8:	66 c7 43 04 00 00    	movw   $0x0,0x4(%ebx)
f010b6ee:	a1 48 e3 11 f0       	mov    0xf011e348,%eax
f010b6f3:	39 c3                	cmp    %eax,%ebx
f010b6f5:	72 0d                	jb     f010b704 <_Z8mem_initv+0x11f1>
f010b6f7:	8b 15 40 e3 11 f0    	mov    0xf011e340,%edx
f010b6fd:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010b700:	39 d3                	cmp    %edx,%ebx
f010b702:	72 24                	jb     f010b728 <_Z8mem_initv+0x1215>
f010b704:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010b70b:	f0 
f010b70c:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b713:	f0 
f010b714:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b71b:	00 
f010b71c:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010b723:	e8 38 d9 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b728:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
f010b72f:	00 
f010b730:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
f010b737:	00 
f010b738:	8b 4d d0             	mov    -0x30(%ebp),%ecx
f010b73b:	29 c1                	sub    %eax,%ecx
f010b73d:	89 c8                	mov    %ecx,%eax
f010b73f:	c1 f8 03             	sar    $0x3,%eax
f010b742:	c1 e0 0c             	shl    $0xc,%eax
f010b745:	2d 00 00 00 10       	sub    $0x10000000,%eax
f010b74a:	89 04 24             	mov    %eax,(%esp)
f010b74d:	e8 dc 11 00 00       	call   f010c92e <_Z6memsetPvij>
f010b752:	89 1c 24             	mov    %ebx,(%esp)
f010b755:	e8 b0 e8 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010b75a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
f010b761:	00 
f010b762:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
f010b769:	00 
f010b76a:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b76f:	89 04 24             	mov    %eax,(%esp)
f010b772:	e8 e2 e9 ff ff       	call   f010a159 <_Z10pgdir_walkPjji>
f010b777:	a1 48 e3 11 f0       	mov    0xf011e348,%eax
f010b77c:	39 c3                	cmp    %eax,%ebx
f010b77e:	72 0d                	jb     f010b78d <_Z8mem_initv+0x127a>
f010b780:	8b 15 40 e3 11 f0    	mov    0xf011e340,%edx
f010b786:	8d 14 d0             	lea    (%eax,%edx,8),%edx
f010b789:	39 d3                	cmp    %edx,%ebx
f010b78b:	72 24                	jb     f010b7b1 <_Z8mem_initv+0x129e>
f010b78d:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010b794:	f0 
f010b795:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b79c:	f0 
f010b79d:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010b7a4:	00 
f010b7a5:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010b7ac:	e8 af d8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b7b1:	8b 55 d0             	mov    -0x30(%ebp),%edx
f010b7b4:	29 c2                	sub    %eax,%edx
f010b7b6:	89 d0                	mov    %edx,%eax
f010b7b8:	c1 f8 03             	sar    $0x3,%eax
f010b7bb:	89 c2                	mov    %eax,%edx
f010b7bd:	c1 e2 0c             	shl    $0xc,%edx
f010b7c0:	8d 82 00 00 00 f0    	lea    -0x10000000(%edx),%eax
f010b7c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010b7c9:	f6 00 01             	testb  $0x1,(%eax)
f010b7cc:	75 11                	jne    f010b7df <_Z8mem_initv+0x12cc>
f010b7ce:	8d 82 04 00 00 f0    	lea    -0xffffffc(%edx),%eax
f010b7d4:	81 ea 00 f0 ff 0f    	sub    $0xffff000,%edx
f010b7da:	f6 00 01             	testb  $0x1,(%eax)
f010b7dd:	74 24                	je     f010b803 <_Z8mem_initv+0x12f0>
f010b7df:	c7 44 24 0c a7 dc 10 	movl   $0xf010dca7,0xc(%esp)
f010b7e6:	f0 
f010b7e7:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b7ee:	f0 
f010b7ef:	c7 44 24 04 32 03 00 	movl   $0x332,0x4(%esp)
f010b7f6:	00 
f010b7f7:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b7fe:	e8 5d d8 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b803:	83 c0 04             	add    $0x4,%eax
f010b806:	39 d0                	cmp    %edx,%eax
f010b808:	75 d0                	jne    f010b7da <_Z8mem_initv+0x12c7>
f010b80a:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b80f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
f010b815:	66 c7 43 04 00 00    	movw   $0x0,0x4(%ebx)
f010b81b:	8b 4d c8             	mov    -0x38(%ebp),%ecx
f010b81e:	89 0d 90 e3 11 f0    	mov    %ecx,0xf011e390
f010b824:	89 1c 24             	mov    %ebx,(%esp)
f010b827:	e8 de e7 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010b82c:	89 3c 24             	mov    %edi,(%esp)
f010b82f:	e8 d6 e7 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010b834:	89 34 24             	mov    %esi,(%esp)
f010b837:	e8 ce e7 ff ff       	call   f010a00a <_Z9page_freeP4Page>
f010b83c:	c7 04 24 be dc 10 f0 	movl   $0xf010dcbe,(%esp)
f010b843:	e8 2f 02 00 00       	call   f010ba77 <_Z7cprintfPKcz>
f010b848:	b8 00 10 10 f0       	mov    $0xf0101000,%eax
f010b84d:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010b852:	77 20                	ja     f010b874 <_Z8mem_initv+0x1361>
f010b854:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010b858:	c7 44 24 08 28 d7 10 	movl   $0xf010d728,0x8(%esp)
f010b85f:	f0 
f010b860:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
f010b867:	00 
f010b868:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b86f:	e8 ec d7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b874:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
f010b87b:	00 
f010b87c:	05 00 00 00 10       	add    $0x10000000,%eax
f010b881:	89 04 24             	mov    %eax,(%esp)
f010b884:	b9 00 80 00 00       	mov    $0x8000,%ecx
f010b889:	ba 00 80 ff ef       	mov    $0xefff8000,%edx
f010b88e:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b893:	e8 76 ea ff ff       	call   f010a30e <_ZL16page_map_segmentPjjjji>
f010b898:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
f010b89f:	00 
f010b8a0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f010b8a7:	b9 00 00 00 10       	mov    $0x10000000,%ecx
f010b8ac:	ba 00 00 00 f0       	mov    $0xf0000000,%edx
f010b8b1:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b8b6:	e8 53 ea ff ff       	call   f010a30e <_ZL16page_map_segmentPjjjji>
f010b8bb:	e8 de e4 ff ff       	call   f0109d9e <_ZL14boot_mem_checkv>
f010b8c0:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b8c5:	8b 90 00 0f 00 00    	mov    0xf00(%eax),%edx
f010b8cb:	89 10                	mov    %edx,(%eax)
f010b8cd:	8b 15 44 e3 11 f0    	mov    0xf011e344,%edx
f010b8d3:	89 d0                	mov    %edx,%eax
f010b8d5:	81 fa ff ff ff ef    	cmp    $0xefffffff,%edx
f010b8db:	77 20                	ja     f010b8fd <_Z8mem_initv+0x13ea>
f010b8dd:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010b8e1:	c7 44 24 08 28 d7 10 	movl   $0xf010d728,0x8(%esp)
f010b8e8:	f0 
f010b8e9:	c7 44 24 04 bf 00 00 	movl   $0xbf,0x4(%esp)
f010b8f0:	00 
f010b8f1:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b8f8:	e8 63 d7 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b8fd:	05 00 00 00 10       	add    $0x10000000,%eax
f010b902:	0f 22 d8             	mov    %eax,%cr3
f010b905:	0f 20 c0             	mov    %cr0,%eax
f010b908:	0d 2f 00 05 80       	or     $0x8005002f,%eax
f010b90d:	83 e0 f3             	and    $0xfffffff3,%eax
f010b910:	0f 22 c0             	mov    %eax,%cr0
f010b913:	0f 01 15 04 90 11 f0 	lgdtl  0xf0119004
f010b91a:	b8 23 00 00 00       	mov    $0x23,%eax
f010b91f:	8e e8                	mov    %eax,%gs
f010b921:	8e e0                	mov    %eax,%fs
f010b923:	b0 10                	mov    $0x10,%al
f010b925:	8e c0                	mov    %eax,%es
f010b927:	8e d8                	mov    %eax,%ds
f010b929:	8e d0                	mov    %eax,%ss
f010b92b:	ea 32 b9 10 f0 08 00 	ljmp   $0x8,$0xf010b932
f010b932:	b0 00                	mov    $0x0,%al
f010b934:	0f 00 d0             	lldt   %ax
f010b937:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
f010b93d:	a1 44 e3 11 f0       	mov    0xf011e344,%eax
f010b942:	3d ff ff ff ef       	cmp    $0xefffffff,%eax
f010b947:	77 20                	ja     f010b969 <_Z8mem_initv+0x1456>
f010b949:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010b94d:	c7 44 24 08 28 d7 10 	movl   $0xf010d728,0x8(%esp)
f010b954:	f0 
f010b955:	c7 44 24 04 db 00 00 	movl   $0xdb,0x4(%esp)
f010b95c:	00 
f010b95d:	c7 04 24 ef da 10 f0 	movl   $0xf010daef,(%esp)
f010b964:	e8 f7 d6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010b969:	05 00 00 00 10       	add    $0x10000000,%eax
f010b96e:	0f 22 d8             	mov    %eax,%cr3
f010b971:	83 c4 3c             	add    $0x3c,%esp
f010b974:	5b                   	pop    %ebx
f010b975:	5e                   	pop    %esi
f010b976:	5f                   	pop    %edi
f010b977:	5d                   	pop    %ebp
f010b978:	c3                   	ret    

f010b979 <_Z8round_upIjET_S0_j>:
T *round_down(T *a, uint32_t n) {
	return (T *) round_down((uintptr_t) a, n);
}

template <typename T>
T round_up(T a, uint32_t n) {
f010b979:	55                   	push   %ebp
f010b97a:	89 e5                	mov    %esp,%ebp
f010b97c:	53                   	push   %ebx
f010b97d:	8b 55 0c             	mov    0xc(%ebp),%edx
	return round_down(a + n - 1, n);
f010b980:	8b 45 08             	mov    0x8(%ebp),%eax
f010b983:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
f010b987:	89 c8                	mov    %ecx,%eax
f010b989:	89 d3                	mov    %edx,%ebx
f010b98b:	ba 00 00 00 00       	mov    $0x0,%edx
f010b990:	f7 f3                	div    %ebx
f010b992:	89 c8                	mov    %ecx,%eax
f010b994:	29 d0                	sub    %edx,%eax
}
f010b996:	5b                   	pop    %ebx
f010b997:	5d                   	pop    %ebp
f010b998:	c3                   	ret    

f010b999 <_Z10round_downIcEPT_S1_j>:
inline uint32_t round_down(uint32_t a, uint32_t n) {
	return a - a % n;
}

template <typename T>
T *round_down(T *a, uint32_t n) {
f010b999:	55                   	push   %ebp
f010b99a:	89 e5                	mov    %esp,%ebp
f010b99c:	8b 4d 08             	mov    0x8(%ebp),%ecx
	return (T *) round_down((uintptr_t) a, n);
f010b99f:	89 c8                	mov    %ecx,%eax
f010b9a1:	ba 00 00 00 00       	mov    $0x0,%edx
f010b9a6:	f7 75 0c             	divl   0xc(%ebp)
f010b9a9:	89 c8                	mov    %ecx,%eax
f010b9ab:	29 d0                	sub    %edx,%eax
}
f010b9ad:	5d                   	pop    %ebp
f010b9ae:	c3                   	ret    

f010b9af <_Z8round_upIPcET_S1_j>:

template <typename T>
T round_up(T a, uint32_t n) {
f010b9af:	55                   	push   %ebp
f010b9b0:	89 e5                	mov    %esp,%ebp
f010b9b2:	83 ec 18             	sub    $0x18,%esp
f010b9b5:	8b 45 0c             	mov    0xc(%ebp),%eax
	return round_down(a + n - 1, n);
f010b9b8:	89 44 24 04          	mov    %eax,0x4(%esp)
f010b9bc:	8b 55 08             	mov    0x8(%ebp),%edx
f010b9bf:	8d 44 02 ff          	lea    -0x1(%edx,%eax,1),%eax
f010b9c3:	89 04 24             	mov    %eax,(%esp)
f010b9c6:	e8 ce ff ff ff       	call   f010b999 <_Z10round_downIcEPT_S1_j>
}
f010b9cb:	c9                   	leave  
f010b9cc:	c3                   	ret    
	...

f010b9ce <_ZNK4Page11page_numberEv>:
	// to this page.  Reserved pages may not have valid reference counts.
	uint16_t pp_ref;

#if JOS_KERNEL
	// Returns the physical page number for this page.
	size_t page_number() const {
f010b9ce:	55                   	push   %ebp
f010b9cf:	89 e5                	mov    %esp,%ebp
f010b9d1:	83 ec 18             	sub    $0x18,%esp
f010b9d4:	8b 55 08             	mov    0x8(%ebp),%edx
		assert(this >= pages && this < pages + npages);
f010b9d7:	a1 48 e3 11 f0       	mov    0xf011e348,%eax
f010b9dc:	39 d0                	cmp    %edx,%eax
f010b9de:	77 0d                	ja     f010b9ed <_ZNK4Page11page_numberEv+0x1f>
f010b9e0:	8b 0d 40 e3 11 f0    	mov    0xf011e340,%ecx
f010b9e6:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
f010b9e9:	39 ca                	cmp    %ecx,%edx
f010b9eb:	72 24                	jb     f010ba11 <_ZNK4Page11page_numberEv+0x43>
f010b9ed:	c7 44 24 0c b0 d6 10 	movl   $0xf010d6b0,0xc(%esp)
f010b9f4:	f0 
f010b9f5:	c7 44 24 08 ac da 10 	movl   $0xf010daac,0x8(%esp)
f010b9fc:	f0 
f010b9fd:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
f010ba04:	00 
f010ba05:	c7 04 24 c1 da 10 f0 	movl   $0xf010dac1,(%esp)
f010ba0c:	e8 4f d6 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010ba11:	29 c2                	sub    %eax,%edx
f010ba13:	89 d0                	mov    %edx,%eax
f010ba15:	c1 f8 03             	sar    $0x3,%eax
		return this - pages;
	}
f010ba18:	c9                   	leave  
f010ba19:	c3                   	ret    
	...

f010ba1c <_Z13mc146818_readj>:
#include <kern/kclock.h>


unsigned
mc146818_read(unsigned reg)
{
f010ba1c:	55                   	push   %ebp
f010ba1d:	89 e5                	mov    %esp,%ebp
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f010ba1f:	ba 70 00 00 00       	mov    $0x70,%edx
f010ba24:	8b 45 08             	mov    0x8(%ebp),%eax
f010ba27:	ee                   	out    %al,(%dx)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
f010ba28:	b2 71                	mov    $0x71,%dl
f010ba2a:	ec                   	in     (%dx),%al
f010ba2b:	0f b6 c0             	movzbl %al,%eax
	outb(IO_RTC, reg);
	return inb(IO_RTC+1);
}
f010ba2e:	5d                   	pop    %ebp
f010ba2f:	c3                   	ret    

f010ba30 <_Z14mc146818_writejj>:

void
mc146818_write(unsigned reg, unsigned datum)
{
f010ba30:	55                   	push   %ebp
f010ba31:	89 e5                	mov    %esp,%ebp
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
f010ba33:	ba 70 00 00 00       	mov    $0x70,%edx
f010ba38:	8b 45 08             	mov    0x8(%ebp),%eax
f010ba3b:	ee                   	out    %al,(%dx)
f010ba3c:	b2 71                	mov    $0x71,%dl
f010ba3e:	8b 45 0c             	mov    0xc(%ebp),%eax
f010ba41:	ee                   	out    %al,(%dx)
	outb(IO_RTC, reg);
	outb(IO_RTC+1, datum);
}
f010ba42:	5d                   	pop    %ebp
f010ba43:	c3                   	ret    

f010ba44 <_Z8vcprintfPKcPc>:
	(*cntptr)++;
}

int
vcprintf(const char *fmt, va_list ap)
{
f010ba44:	55                   	push   %ebp
f010ba45:	89 e5                	mov    %esp,%ebp
f010ba47:	83 ec 28             	sub    $0x28,%esp
	int cnt = 0;
f010ba4a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

	vprintfmt(putch, &cnt, fmt, ap);
f010ba51:	8b 45 0c             	mov    0xc(%ebp),%eax
f010ba54:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010ba58:	8b 45 08             	mov    0x8(%ebp),%eax
f010ba5b:	89 44 24 08          	mov    %eax,0x8(%esp)
f010ba5f:	8d 45 f4             	lea    -0xc(%ebp),%eax
f010ba62:	89 44 24 04          	mov    %eax,0x4(%esp)
f010ba66:	c7 04 24 91 ba 10 f0 	movl   $0xf010ba91,(%esp)
f010ba6d:	e8 9e 07 00 00       	call   f010c210 <_Z9vprintfmtPFviPvES_PKcPc>
	return cnt;
}
f010ba72:	8b 45 f4             	mov    -0xc(%ebp),%eax
f010ba75:	c9                   	leave  
f010ba76:	c3                   	ret    

f010ba77 <_Z7cprintfPKcz>:

int
cprintf(const char *fmt, ...)
{
f010ba77:	55                   	push   %ebp
f010ba78:	89 e5                	mov    %esp,%ebp
f010ba7a:	83 ec 18             	sub    $0x18,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
	cnt = vcprintf(fmt, ap);
f010ba7d:	8d 45 0c             	lea    0xc(%ebp),%eax
f010ba80:	89 44 24 04          	mov    %eax,0x4(%esp)
f010ba84:	8b 45 08             	mov    0x8(%ebp),%eax
f010ba87:	89 04 24             	mov    %eax,(%esp)
f010ba8a:	e8 b5 ff ff ff       	call   f010ba44 <_Z8vcprintfPKcPc>
	va_end(ap);

	return cnt;
}
f010ba8f:	c9                   	leave  
f010ba90:	c3                   	ret    

f010ba91 <_ZL5putchiPv>:
#include <inc/stdarg.h>


static void
putch(int ch, void *thunk)
{
f010ba91:	55                   	push   %ebp
f010ba92:	89 e5                	mov    %esp,%ebp
f010ba94:	53                   	push   %ebx
f010ba95:	83 ec 14             	sub    $0x14,%esp
f010ba98:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	cputchar(ch);
f010ba9b:	8b 45 08             	mov    0x8(%ebp),%eax
f010ba9e:	89 04 24             	mov    %eax,(%esp)
f010baa1:	e8 9e dd ff ff       	call   f0109844 <_Z8cputchari>
	int *cntptr = (int *) thunk;
	(*cntptr)++;
f010baa6:	83 03 01             	addl   $0x1,(%ebx)
}
f010baa9:	83 c4 14             	add    $0x14,%esp
f010baac:	5b                   	pop    %ebx
f010baad:	5d                   	pop    %ebp
f010baae:	c3                   	ret    
	...

f010bab0 <_ZL8trapnamei>:
	sizeof(idt) - 1, (uint32_t) idt
};


static const char *trapname(int trapno)
{
f010bab0:	55                   	push   %ebp
f010bab1:	89 e5                	mov    %esp,%ebp
f010bab3:	8b 55 08             	mov    0x8(%ebp),%edx
		"Alignment Check",
		"Machine-Check",
		"SIMD Floating-Point Exception"
	};

	if ((size_t) trapno < sizeof(excnames) / sizeof(excnames[0]))
f010bab6:	83 fa 13             	cmp    $0x13,%edx
f010bab9:	77 09                	ja     f010bac4 <_ZL8trapnamei+0x14>
		return excnames[trapno];
f010babb:	8b 04 95 e0 df 10 f0 	mov    -0xfef2020(,%edx,4),%eax
f010bac2:	eb 0f                	jmp    f010bad3 <_ZL8trapnamei+0x23>
	if (trapno == T_SYSCALL)
f010bac4:	b8 17 dd 10 f0       	mov    $0xf010dd17,%eax
f010bac9:	83 fa 30             	cmp    $0x30,%edx
f010bacc:	74 05                	je     f010bad3 <_ZL8trapnamei+0x23>
f010bace:	b8 08 dd 10 f0       	mov    $0xf010dd08,%eax
		return "System call";

	return "(unknown trap)";
}
f010bad3:	5d                   	pop    %ebp
f010bad4:	c3                   	ret    

f010bad5 <_Z8idt_initv>:


void
idt_init(void)
{
f010bad5:	55                   	push   %ebp
f010bad6:	89 e5                	mov    %esp,%ebp
	extern struct Segdesc gdt[];
	// LAB 2: Your code here.
	//extern char* t_brkpt_lbl;
	extern char t_brkpt_lbl[];
	SETGATE(idt[3], 0, GD_KT, t_brkpt_lbl, 3);	
f010bad8:	b8 32 90 11 f0       	mov    $0xf0119032,%eax
f010badd:	66 a3 b8 e3 11 f0    	mov    %ax,0xf011e3b8
f010bae3:	66 c7 05 ba e3 11 f0 	movw   $0x8,0xf011e3ba
f010baea:	08 00 
f010baec:	c6 05 bc e3 11 f0 00 	movb   $0x0,0xf011e3bc
f010baf3:	c6 05 bd e3 11 f0 ee 	movb   $0xee,0xf011e3bd
f010bafa:	c1 e8 10             	shr    $0x10,%eax
f010bafd:	66 a3 be e3 11 f0    	mov    %ax,0xf011e3be
	// Hint: Must this gate be accessible from userlevel?
	// LAB 3: Your code here.
	
	// Setup a TSS so that we get the right stack
	// when we trap to the kernel.
	ts.ts_esp0 = KSTACKTOP;
f010bb03:	c7 05 a4 eb 11 f0 00 	movl   $0xf0000000,0xf011eba4
f010bb0a:	00 00 f0 
	ts.ts_ss0 = GD_KD;
f010bb0d:	66 c7 05 a8 eb 11 f0 	movw   $0x10,0xf011eba8
f010bb14:	10 00 

	// Initialize the TSS field of the gdt.
	gdt[GD_TSS >> 3] = SEG16(STS_T32A, (uint32_t) (&ts),
					sizeof(struct Taskstate), 0);
f010bb16:	66 c7 05 88 e3 11 f0 	movw   $0x68,0xf011e388
f010bb1d:	68 00 
f010bb1f:	b8 a0 eb 11 f0       	mov    $0xf011eba0,%eax
f010bb24:	66 a3 8a e3 11 f0    	mov    %ax,0xf011e38a
f010bb2a:	89 c2                	mov    %eax,%edx
f010bb2c:	c1 ea 10             	shr    $0x10,%edx
f010bb2f:	88 15 8c e3 11 f0    	mov    %dl,0xf011e38c
f010bb35:	c6 05 8e e3 11 f0 40 	movb   $0x40,0xf011e38e
f010bb3c:	c1 e8 18             	shr    $0x18,%eax
f010bb3f:	a2 8f e3 11 f0       	mov    %al,0xf011e38f
	gdt[GD_TSS >> 3].sd_s = 0;
f010bb44:	c6 05 8d e3 11 f0 89 	movb   $0x89,0xf011e38d
}

static __inline void
ltr(uint16_t sel)
{
	__asm __volatile("ltr %0" : : "r" (sel));
f010bb4b:	b8 28 00 00 00       	mov    $0x28,%eax
f010bb50:	0f 00 d8             	ltr    %ax

	// Load the TSS
	ltr(GD_TSS);

	// Load the IDT
	asm volatile("lidt idt_pd");
f010bb53:	0f 01 1d 0c 90 11 f0 	lidtl  0xf011900c
}
f010bb5a:	5d                   	pop    %ebp
f010bb5b:	c3                   	ret    

f010bb5c <_Z10print_regsP9Registers>:
	cprintf("  ss   0x----%04x\n", tf->tf_ss);
}

void
print_regs(struct Registers *regs)
{
f010bb5c:	55                   	push   %ebp
f010bb5d:	89 e5                	mov    %esp,%ebp
f010bb5f:	53                   	push   %ebx
f010bb60:	83 ec 14             	sub    $0x14,%esp
f010bb63:	8b 5d 08             	mov    0x8(%ebp),%ebx
	cprintf("  edi  0x%08x\n", regs->reg_edi);
f010bb66:	8b 03                	mov    (%ebx),%eax
f010bb68:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bb6c:	c7 04 24 23 dd 10 f0 	movl   $0xf010dd23,(%esp)
f010bb73:	e8 ff fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  esi  0x%08x\n", regs->reg_esi);
f010bb78:	8b 43 04             	mov    0x4(%ebx),%eax
f010bb7b:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bb7f:	c7 04 24 32 dd 10 f0 	movl   $0xf010dd32,(%esp)
f010bb86:	e8 ec fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  ebp  0x%08x\n", regs->reg_ebp);
f010bb8b:	8b 43 08             	mov    0x8(%ebx),%eax
f010bb8e:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bb92:	c7 04 24 41 dd 10 f0 	movl   $0xf010dd41,(%esp)
f010bb99:	e8 d9 fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  oesp 0x%08x\n", regs->reg_oesp);
f010bb9e:	8b 43 0c             	mov    0xc(%ebx),%eax
f010bba1:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bba5:	c7 04 24 50 dd 10 f0 	movl   $0xf010dd50,(%esp)
f010bbac:	e8 c6 fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  ebx  0x%08x\n", regs->reg_ebx);
f010bbb1:	8b 43 10             	mov    0x10(%ebx),%eax
f010bbb4:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bbb8:	c7 04 24 5f dd 10 f0 	movl   $0xf010dd5f,(%esp)
f010bbbf:	e8 b3 fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  edx  0x%08x\n", regs->reg_edx);
f010bbc4:	8b 43 14             	mov    0x14(%ebx),%eax
f010bbc7:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bbcb:	c7 04 24 6e dd 10 f0 	movl   $0xf010dd6e,(%esp)
f010bbd2:	e8 a0 fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  ecx  0x%08x\n", regs->reg_ecx);
f010bbd7:	8b 43 18             	mov    0x18(%ebx),%eax
f010bbda:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bbde:	c7 04 24 7d dd 10 f0 	movl   $0xf010dd7d,(%esp)
f010bbe5:	e8 8d fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  eax  0x%08x\n", regs->reg_eax);
f010bbea:	8b 43 1c             	mov    0x1c(%ebx),%eax
f010bbed:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bbf1:	c7 04 24 8c dd 10 f0 	movl   $0xf010dd8c,(%esp)
f010bbf8:	e8 7a fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
}
f010bbfd:	83 c4 14             	add    $0x14,%esp
f010bc00:	5b                   	pop    %ebx
f010bc01:	5d                   	pop    %ebp
f010bc02:	c3                   	ret    

f010bc03 <_Z15print_trapframeP9Trapframe>:
}


void
print_trapframe(struct Trapframe *tf)
{
f010bc03:	55                   	push   %ebp
f010bc04:	89 e5                	mov    %esp,%ebp
f010bc06:	56                   	push   %esi
f010bc07:	53                   	push   %ebx
f010bc08:	83 ec 10             	sub    $0x10,%esp
f010bc0b:	8b 5d 08             	mov    0x8(%ebp),%ebx
	cprintf("TRAP frame at %p\n", tf);
f010bc0e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010bc12:	c7 04 24 9b dd 10 f0 	movl   $0xf010dd9b,(%esp)
f010bc19:	e8 59 fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	print_regs(&tf->tf_regs);
f010bc1e:	89 1c 24             	mov    %ebx,(%esp)
f010bc21:	e8 36 ff ff ff       	call   f010bb5c <_Z10print_regsP9Registers>
	cprintf("  es   0x----%04x\n", tf->tf_es);
f010bc26:	0f b7 43 20          	movzwl 0x20(%ebx),%eax
f010bc2a:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bc2e:	c7 04 24 ad dd 10 f0 	movl   $0xf010ddad,(%esp)
f010bc35:	e8 3d fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  ds   0x----%04x\n", tf->tf_ds);
f010bc3a:	0f b7 43 24          	movzwl 0x24(%ebx),%eax
f010bc3e:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bc42:	c7 04 24 c0 dd 10 f0 	movl   $0xf010ddc0,(%esp)
f010bc49:	e8 29 fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
f010bc4e:	8b 73 28             	mov    0x28(%ebx),%esi
f010bc51:	89 34 24             	mov    %esi,(%esp)
f010bc54:	e8 57 fe ff ff       	call   f010bab0 <_ZL8trapnamei>
f010bc59:	89 44 24 08          	mov    %eax,0x8(%esp)
f010bc5d:	89 74 24 04          	mov    %esi,0x4(%esp)
f010bc61:	c7 04 24 d3 dd 10 f0 	movl   $0xf010ddd3,(%esp)
f010bc68:	e8 0a fe ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  err  0x%08x\n", tf->tf_err);
f010bc6d:	8b 43 2c             	mov    0x2c(%ebx),%eax
f010bc70:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bc74:	c7 04 24 e5 dd 10 f0 	movl   $0xf010dde5,(%esp)
f010bc7b:	e8 f7 fd ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  eip  0x%08x\n", tf->tf_eip);
f010bc80:	8b 43 30             	mov    0x30(%ebx),%eax
f010bc83:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bc87:	c7 04 24 f4 dd 10 f0 	movl   $0xf010ddf4,(%esp)
f010bc8e:	e8 e4 fd ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  cs   0x----%04x\n", tf->tf_cs);
f010bc93:	0f b7 43 34          	movzwl 0x34(%ebx),%eax
f010bc97:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bc9b:	c7 04 24 03 de 10 f0 	movl   $0xf010de03,(%esp)
f010bca2:	e8 d0 fd ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  flag 0x%08x\n", tf->tf_eflags);
f010bca7:	8b 43 38             	mov    0x38(%ebx),%eax
f010bcaa:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bcae:	c7 04 24 16 de 10 f0 	movl   $0xf010de16,(%esp)
f010bcb5:	e8 bd fd ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  esp  0x%08x\n", tf->tf_esp);
f010bcba:	8b 43 3c             	mov    0x3c(%ebx),%eax
f010bcbd:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bcc1:	c7 04 24 25 de 10 f0 	movl   $0xf010de25,(%esp)
f010bcc8:	e8 aa fd ff ff       	call   f010ba77 <_Z7cprintfPKcz>
	cprintf("  ss   0x----%04x\n", tf->tf_ss);
f010bccd:	0f b7 43 40          	movzwl 0x40(%ebx),%eax
f010bcd1:	89 44 24 04          	mov    %eax,0x4(%esp)
f010bcd5:	c7 04 24 34 de 10 f0 	movl   $0xf010de34,(%esp)
f010bcdc:	e8 96 fd ff ff       	call   f010ba77 <_Z7cprintfPKcz>
}
f010bce1:	83 c4 10             	add    $0x10,%esp
f010bce4:	5b                   	pop    %ebx
f010bce5:	5e                   	pop    %esi
f010bce6:	5d                   	pop    %ebp
f010bce7:	c3                   	ret    

f010bce8 <trap>:
}

extern "C" {
void
trap(struct Trapframe *tf)
{
f010bce8:	55                   	push   %ebp
f010bce9:	89 e5                	mov    %esp,%ebp
f010bceb:	53                   	push   %ebx
f010bcec:	83 ec 14             	sub    $0x14,%esp
f010bcef:	8b 5d 08             	mov    0x8(%ebp),%ebx
	// Dispatch based on what type of trap occurred
	switch (tf->tf_trapno) {
f010bcf2:	83 7b 28 03          	cmpl   $0x3,0x28(%ebx)
f010bcf6:	75 0e                	jne    f010bd06 <trap+0x1e>

	// LAB 2: Your code here.
	case T_BRKPT:
		monitor(tf);
f010bcf8:	89 1c 24             	mov    %ebx,(%esp)
f010bcfb:	e8 88 dc ff ff       	call   f0109988 <_Z7monitorP9Trapframe>
		if (tf->tf_cs == GD_KT)
			panic("unhandled trap in kernel");
		else
			panic("unhandled trap in user mode");
	}
}
f010bd00:	83 c4 14             	add    $0x14,%esp
f010bd03:	5b                   	pop    %ebx
f010bd04:	5d                   	pop    %ebp
f010bd05:	c3                   	ret    
	case T_BRKPT:
		monitor(tf);
		return;
	default:
		// Unexpected trap: The user process or the kernel has a bug.
		print_trapframe(tf);
f010bd06:	89 1c 24             	mov    %ebx,(%esp)
f010bd09:	e8 f5 fe ff ff       	call   f010bc03 <_Z15print_trapframeP9Trapframe>
		if (tf->tf_cs == GD_KT)
f010bd0e:	66 83 7b 34 08       	cmpw   $0x8,0x34(%ebx)
f010bd13:	75 1c                	jne    f010bd31 <trap+0x49>
			panic("unhandled trap in kernel");
f010bd15:	c7 44 24 08 47 de 10 	movl   $0xf010de47,0x8(%esp)
f010bd1c:	f0 
f010bd1d:	c7 44 24 04 81 00 00 	movl   $0x81,0x4(%esp)
f010bd24:	00 
f010bd25:	c7 04 24 60 de 10 f0 	movl   $0xf010de60,(%esp)
f010bd2c:	e8 2f d3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
		else
			panic("unhandled trap in user mode");
f010bd31:	c7 44 24 08 6c de 10 	movl   $0xf010de6c,0x8(%esp)
f010bd38:	f0 
f010bd39:	c7 44 24 04 83 00 00 	movl   $0x83,0x4(%esp)
f010bd40:	00 
f010bd41:	c7 04 24 60 de 10 f0 	movl   $0xf010de60,(%esp)
f010bd48:	e8 13 d3 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
f010bd4d:	00 00                	add    %al,(%eax)
	...

f010bd50 <_alltraps>:
	jmp _alltraps

.data
.globl idttbl
idttbl: 
       TRAPHANDLER_NOEC(t_divide_lbl,T_DIVIDE)
f010bd50:	1e                   	push   %ds
f010bd51:	06                   	push   %es
f010bd52:	60                   	pusha  
f010bd53:	66 b8 10 00          	mov    $0x10,%ax
f010bd57:	8e d8                	mov    %eax,%ds
f010bd59:	8e c0                	mov    %eax,%es
f010bd5b:	54                   	push   %esp
f010bd5c:	e8 87 ff ff ff       	call   f010bce8 <trap>
f010bd61:	5c                   	pop    %esp
f010bd62:	61                   	popa   
f010bd63:	07                   	pop    %es
f010bd64:	1f                   	pop    %ds
f010bd65:	cf                   	iret   
	...

f010bd70 <_ZL14stab_binsearchPK4StabPiS2_ij>:
//	will exit setting left = 118, right = 554.
//
static void
stab_binsearch(const struct Stab *stabs, int *region_left, int *region_right,
	       int type, uintptr_t addr)
{
f010bd70:	55                   	push   %ebp
f010bd71:	89 e5                	mov    %esp,%ebp
f010bd73:	57                   	push   %edi
f010bd74:	56                   	push   %esi
f010bd75:	53                   	push   %ebx
f010bd76:	83 ec 14             	sub    $0x14,%esp
f010bd79:	89 45 f0             	mov    %eax,-0x10(%ebp)
f010bd7c:	89 55 e8             	mov    %edx,-0x18(%ebp)
f010bd7f:	89 4d e0             	mov    %ecx,-0x20(%ebp)
f010bd82:	8b 7d 08             	mov    0x8(%ebp),%edi
	int l = *region_left, r = *region_right, any_matches = 0;
f010bd85:	8b 12                	mov    (%edx),%edx
f010bd87:	8b 09                	mov    (%ecx),%ecx
f010bd89:	89 4d ec             	mov    %ecx,-0x14(%ebp)
	
	while (l <= r) {
f010bd8c:	39 ca                	cmp    %ecx,%edx
f010bd8e:	0f 8f 8c 00 00 00    	jg     f010be20 <_ZL14stab_binsearchPK4StabPiS2_ij+0xb0>
f010bd94:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
		int true_m = (l + r) / 2, m = true_m;
f010bd9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
f010bd9e:	01 d0                	add    %edx,%eax
f010bda0:	89 c6                	mov    %eax,%esi
f010bda2:	c1 ee 1f             	shr    $0x1f,%esi
f010bda5:	01 c6                	add    %eax,%esi
f010bda7:	d1 fe                	sar    %esi
f010bda9:	8d 04 76             	lea    (%esi,%esi,2),%eax
f010bdac:	8b 5d f0             	mov    -0x10(%ebp),%ebx
f010bdaf:	8d 4c 83 04          	lea    0x4(%ebx,%eax,4),%ecx
f010bdb3:	89 f0                	mov    %esi,%eax
		
		// search for earliest stab with right type
		while (m >= l && stabs[m].n_type != type)
f010bdb5:	39 d0                	cmp    %edx,%eax
f010bdb7:	0f 8c bb 00 00 00    	jl     f010be78 <_ZL14stab_binsearchPK4StabPiS2_ij+0x108>
f010bdbd:	0f b6 19             	movzbl (%ecx),%ebx
f010bdc0:	83 e9 0c             	sub    $0xc,%ecx
f010bdc3:	39 fb                	cmp    %edi,%ebx
f010bdc5:	0f 84 8b 00 00 00    	je     f010be56 <_ZL14stab_binsearchPK4StabPiS2_ij+0xe6>
			m--;
f010bdcb:	83 e8 01             	sub    $0x1,%eax
f010bdce:	eb e5                	jmp    f010bdb5 <_ZL14stab_binsearchPK4StabPiS2_ij+0x45>
		}

		// actual binary search
		any_matches = 1;
		if (stabs[m].n_value < addr) {
			*region_left = m;
f010bdd0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010bdd3:	8b 45 e8             	mov    -0x18(%ebp),%eax
f010bdd6:	89 10                	mov    %edx,(%eax)
			l = true_m + 1;
f010bdd8:	8d 56 01             	lea    0x1(%esi),%edx
f010bddb:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
f010bde2:	eb 31                	jmp    f010be15 <_ZL14stab_binsearchPK4StabPiS2_ij+0xa5>
		} else if (stabs[m].n_value > addr) {
f010bde4:	3b 4d 0c             	cmp    0xc(%ebp),%ecx
f010bde7:	76 17                	jbe    f010be00 <_ZL14stab_binsearchPK4StabPiS2_ij+0x90>
			*region_right = m - 1;
f010bde9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f010bdec:	83 e9 01             	sub    $0x1,%ecx
f010bdef:	89 4d ec             	mov    %ecx,-0x14(%ebp)
f010bdf2:	8b 5d e0             	mov    -0x20(%ebp),%ebx
f010bdf5:	89 0b                	mov    %ecx,(%ebx)
f010bdf7:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
f010bdfe:	eb 15                	jmp    f010be15 <_ZL14stab_binsearchPK4StabPiS2_ij+0xa5>
			r = m - 1;
		} else {
			// exact match for 'addr', but continue loop to find
			// *region_right
			*region_left = m;
f010be00:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f010be03:	8b 55 e8             	mov    -0x18(%ebp),%edx
f010be06:	89 0a                	mov    %ecx,(%edx)
			l = m;
			addr++;
f010be08:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
f010be0c:	89 c2                	mov    %eax,%edx
f010be0e:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
stab_binsearch(const struct Stab *stabs, int *region_left, int *region_right,
	       int type, uintptr_t addr)
{
	int l = *region_left, r = *region_right, any_matches = 0;
	
	while (l <= r) {
f010be15:	39 55 ec             	cmp    %edx,-0x14(%ebp)
f010be18:	7d 81                	jge    f010bd9b <_ZL14stab_binsearchPK4StabPiS2_ij+0x2b>
			l = m;
			addr++;
		}
	}

	if (!any_matches)
f010be1a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
f010be1e:	75 0f                	jne    f010be2f <_ZL14stab_binsearchPK4StabPiS2_ij+0xbf>
		*region_right = *region_left - 1;
f010be20:	8b 5d e8             	mov    -0x18(%ebp),%ebx
f010be23:	8b 03                	mov    (%ebx),%eax
f010be25:	83 e8 01             	sub    $0x1,%eax
f010be28:	8b 55 e0             	mov    -0x20(%ebp),%edx
f010be2b:	89 02                	mov    %eax,(%edx)
f010be2d:	eb 53                	jmp    f010be82 <_ZL14stab_binsearchPK4StabPiS2_ij+0x112>
	else {
		// find rightmost region containing 'addr'
		for (l = *region_right;
f010be2f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f010be32:	8b 01                	mov    (%ecx),%eax
f010be34:	8b 5d e8             	mov    -0x18(%ebp),%ebx
f010be37:	8b 0b                	mov    (%ebx),%ecx
f010be39:	8d 14 40             	lea    (%eax,%eax,2),%edx
f010be3c:	8b 5d f0             	mov    -0x10(%ebp),%ebx
f010be3f:	8d 54 93 04          	lea    0x4(%ebx,%edx,4),%edx
f010be43:	39 c8                	cmp    %ecx,%eax
f010be45:	7e 2a                	jle    f010be71 <_ZL14stab_binsearchPK4StabPiS2_ij+0x101>
f010be47:	0f b6 1a             	movzbl (%edx),%ebx
f010be4a:	83 ea 0c             	sub    $0xc,%edx
f010be4d:	39 fb                	cmp    %edi,%ebx
f010be4f:	74 20                	je     f010be71 <_ZL14stab_binsearchPK4StabPiS2_ij+0x101>
f010be51:	83 e8 01             	sub    $0x1,%eax
f010be54:	eb ed                	jmp    f010be43 <_ZL14stab_binsearchPK4StabPiS2_ij+0xd3>
		     l > *region_left && stabs[l].n_type != type;
		     l--)
			/* do nothing */;
		*region_left = l;
	}
}
f010be56:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			continue;
		}

		// actual binary search
		any_matches = 1;
		if (stabs[m].n_value < addr) {
f010be59:	8d 0c 40             	lea    (%eax,%eax,2),%ecx
f010be5c:	8b 5d f0             	mov    -0x10(%ebp),%ebx
f010be5f:	8b 4c 8b 08          	mov    0x8(%ebx,%ecx,4),%ecx
f010be63:	3b 4d 0c             	cmp    0xc(%ebp),%ecx
f010be66:	0f 82 64 ff ff ff    	jb     f010bdd0 <_ZL14stab_binsearchPK4StabPiS2_ij+0x60>
f010be6c:	e9 73 ff ff ff       	jmp    f010bde4 <_ZL14stab_binsearchPK4StabPiS2_ij+0x74>
		// find rightmost region containing 'addr'
		for (l = *region_right;
		     l > *region_left && stabs[l].n_type != type;
		     l--)
			/* do nothing */;
		*region_left = l;
f010be71:	8b 55 e8             	mov    -0x18(%ebp),%edx
f010be74:	89 02                	mov    %eax,(%edx)
f010be76:	eb 0a                	jmp    f010be82 <_ZL14stab_binsearchPK4StabPiS2_ij+0x112>
		
		// search for earliest stab with right type
		while (m >= l && stabs[m].n_type != type)
			m--;
		if (m < l) {	// no match in [l, m]
			l = true_m + 1;
f010be78:	8d 56 01             	lea    0x1(%esi),%edx
			continue;
f010be7b:	90                   	nop
f010be7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010be80:	eb 93                	jmp    f010be15 <_ZL14stab_binsearchPK4StabPiS2_ij+0xa5>
		     l > *region_left && stabs[l].n_type != type;
		     l--)
			/* do nothing */;
		*region_left = l;
	}
}
f010be82:	83 c4 14             	add    $0x14,%esp
f010be85:	5b                   	pop    %ebx
f010be86:	5e                   	pop    %esi
f010be87:	5f                   	pop    %edi
f010be88:	5d                   	pop    %ebp
f010be89:	c3                   	ret    

f010be8a <_Z13debuginfo_eipjP12Eipdebuginfo>:
//	negative if not.  But even if it returns negative it has stored some
//	information into '*info'.
//
int
debuginfo_eip(uintptr_t addr, struct Eipdebuginfo *info)
{
f010be8a:	55                   	push   %ebp
f010be8b:	89 e5                	mov    %esp,%ebp
f010be8d:	83 ec 48             	sub    $0x48,%esp
f010be90:	89 5d f4             	mov    %ebx,-0xc(%ebp)
f010be93:	89 75 f8             	mov    %esi,-0x8(%ebp)
f010be96:	89 7d fc             	mov    %edi,-0x4(%ebp)
f010be99:	8b 75 08             	mov    0x8(%ebp),%esi
f010be9c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	const struct Stab *stabs, *stab_end;
	const char *stabstr, *stabstr_end;
	int lfile, rfile, lfun, rfun, lline, rline;

	// Initialize *info
	info->eip_file = "<unknown>";
f010be9f:	c7 03 30 e0 10 f0    	movl   $0xf010e030,(%ebx)
	info->eip_line = 0;
f010bea5:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
	info->eip_fn_name = "<unknown>";
f010beac:	c7 43 08 30 e0 10 f0 	movl   $0xf010e030,0x8(%ebx)
	info->eip_fn_namelen = 9;
f010beb3:	c7 43 0c 09 00 00 00 	movl   $0x9,0xc(%ebx)
	info->eip_fn_addr = addr;
f010beba:	89 73 10             	mov    %esi,0x10(%ebx)
	info->eip_fn_narg = 0;
f010bebd:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)

	// Find the relevant set of stabs
	if (addr >= ULIM) {
f010bec4:	81 fe ff ff bf ef    	cmp    $0xefbfffff,%esi
f010beca:	76 12                	jbe    f010bede <_Z13debuginfo_eipjP12Eipdebuginfo+0x54>
		// Can't search for user-level addresses yet!
  	        panic("User address");
	}

	// String table validity checks
	if (stabstr_end <= stabstr || stabstr_end[-1] != 0)
f010becc:	b8 ba 80 11 f0       	mov    $0xf01180ba,%eax
f010bed1:	3d 9d 4f 11 f0       	cmp    $0xf0114f9d,%eax
f010bed6:	0f 86 a5 01 00 00    	jbe    f010c081 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1f7>
f010bedc:	eb 1c                	jmp    f010befa <_Z13debuginfo_eipjP12Eipdebuginfo+0x70>
		stab_end = __STAB_END__;
		stabstr = __STABSTR_BEGIN__;
		stabstr_end = __STABSTR_END__;
	} else {
		// Can't search for user-level addresses yet!
  	        panic("User address");
f010bede:	c7 44 24 08 3a e0 10 	movl   $0xf010e03a,0x8(%esp)
f010bee5:	f0 
f010bee6:	c7 44 24 04 7f 00 00 	movl   $0x7f,0x4(%esp)
f010beed:	00 
f010beee:	c7 04 24 47 e0 10 f0 	movl   $0xf010e047,(%esp)
f010bef5:	e8 66 d1 ff ff       	call   f0109060 <_Z6_panicPKciS0_z>
	}

	// String table validity checks
	if (stabstr_end <= stabstr || stabstr_end[-1] != 0)
f010befa:	80 3d b9 80 11 f0 00 	cmpb   $0x0,0xf01180b9
f010bf01:	0f 85 7a 01 00 00    	jne    f010c081 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1f7>
	// 'eip'.  First, we find the basic source file containing 'eip'.
	// Then, we look in that source file for the function.  Then we look
	// for the line number.
	
	// Search the entire set of stabs for the source file (type N_SO).
	lfile = 0;
f010bf07:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	rfile = (stab_end - stabs) - 1;
f010bf0e:	b8 9c 4f 11 f0       	mov    $0xf0114f9c,%eax
f010bf13:	2d 64 e2 10 f0       	sub    $0xf010e264,%eax
f010bf18:	c1 f8 02             	sar    $0x2,%eax
f010bf1b:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
f010bf21:	83 e8 01             	sub    $0x1,%eax
f010bf24:	89 45 e0             	mov    %eax,-0x20(%ebp)
	stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
f010bf27:	8d 4d e0             	lea    -0x20(%ebp),%ecx
f010bf2a:	8d 55 e4             	lea    -0x1c(%ebp),%edx
f010bf2d:	89 74 24 04          	mov    %esi,0x4(%esp)
f010bf31:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
f010bf38:	b8 64 e2 10 f0       	mov    $0xf010e264,%eax
f010bf3d:	e8 2e fe ff ff       	call   f010bd70 <_ZL14stab_binsearchPK4StabPiS2_ij>
	if (lfile == 0)
f010bf42:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010bf45:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010bf4a:	85 d2                	test   %edx,%edx
f010bf4c:	0f 84 3b 01 00 00    	je     f010c08d <_Z13debuginfo_eipjP12Eipdebuginfo+0x203>
		return -1;

	// Search within that file's stabs for the function definition
	// (N_FUN).
	lfun = lfile;
f010bf52:	89 55 dc             	mov    %edx,-0x24(%ebp)
	rfun = rfile;
f010bf55:	8b 45 e0             	mov    -0x20(%ebp),%eax
f010bf58:	89 45 d8             	mov    %eax,-0x28(%ebp)
	stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
f010bf5b:	8d 4d d8             	lea    -0x28(%ebp),%ecx
f010bf5e:	8d 55 dc             	lea    -0x24(%ebp),%edx
f010bf61:	89 74 24 04          	mov    %esi,0x4(%esp)
f010bf65:	c7 04 24 24 00 00 00 	movl   $0x24,(%esp)
f010bf6c:	b8 64 e2 10 f0       	mov    $0xf010e264,%eax
f010bf71:	e8 fa fd ff ff       	call   f010bd70 <_ZL14stab_binsearchPK4StabPiS2_ij>

	if (lfun <= rfun) {
f010bf76:	8b 45 dc             	mov    -0x24(%ebp),%eax
f010bf79:	3b 45 d8             	cmp    -0x28(%ebp),%eax
f010bf7c:	7f 3c                	jg     f010bfba <_Z13debuginfo_eipjP12Eipdebuginfo+0x130>
		// stabs[lfun] points to the function name
		// in the string table, but check bounds just in case.
		if (stabs[lfun].n_strx < (uint32_t) (stabstr_end - stabstr))
f010bf7e:	6b c0 0c             	imul   $0xc,%eax,%eax
f010bf81:	8b 80 64 e2 10 f0    	mov    -0xfef1d9c(%eax),%eax
f010bf87:	ba ba 80 11 f0       	mov    $0xf01180ba,%edx
f010bf8c:	81 ea 9d 4f 11 f0    	sub    $0xf0114f9d,%edx
f010bf92:	39 d0                	cmp    %edx,%eax
f010bf94:	73 08                	jae    f010bf9e <_Z13debuginfo_eipjP12Eipdebuginfo+0x114>
			info->eip_fn_name = stabstr + stabs[lfun].n_strx;
f010bf96:	05 9d 4f 11 f0       	add    $0xf0114f9d,%eax
f010bf9b:	89 43 08             	mov    %eax,0x8(%ebx)
		info->eip_fn_addr = stabs[lfun].n_value;
f010bf9e:	8b 45 dc             	mov    -0x24(%ebp),%eax
f010bfa1:	6b d0 0c             	imul   $0xc,%eax,%edx
f010bfa4:	8b 92 6c e2 10 f0    	mov    -0xfef1d94(%edx),%edx
f010bfaa:	89 53 10             	mov    %edx,0x10(%ebx)
		addr -= info->eip_fn_addr;
f010bfad:	29 d6                	sub    %edx,%esi
		// Search within the function definition for the line number.
		lline = lfun;
f010bfaf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
		rline = rfun;
f010bfb2:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010bfb5:	89 45 d0             	mov    %eax,-0x30(%ebp)
f010bfb8:	eb 0f                	jmp    f010bfc9 <_Z13debuginfo_eipjP12Eipdebuginfo+0x13f>
	} else {
		// Couldn't find function stab!  Maybe we're in an assembly
		// file.  Search the whole file for the line number.
		info->eip_fn_addr = addr;
f010bfba:	89 73 10             	mov    %esi,0x10(%ebx)
		lline = lfile;
f010bfbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f010bfc0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
		rline = rfile;
f010bfc3:	8b 45 e0             	mov    -0x20(%ebp),%eax
f010bfc6:	89 45 d0             	mov    %eax,-0x30(%ebp)
	}
	// Ignore stuff after the colon.
	info->eip_fn_namelen =
		strfind(info->eip_fn_name, ':') - info->eip_fn_name;
f010bfc9:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
f010bfd0:	00 
f010bfd1:	8b 43 08             	mov    0x8(%ebx),%eax
f010bfd4:	89 04 24             	mov    %eax,(%esp)
f010bfd7:	e8 27 09 00 00       	call   f010c903 <_Z7strfindPKcc>
f010bfdc:	2b 43 08             	sub    0x8(%ebx),%eax
f010bfdf:	89 43 0c             	mov    %eax,0xc(%ebx)
	// Hint:
	//	There's a particular stabs type used for line numbers.
	//	Look at the STABS documentation and <inc/stab.h> to find
	//	which one.
	// Your code here.
	stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
f010bfe2:	8d 4d d0             	lea    -0x30(%ebp),%ecx
f010bfe5:	8d 55 d4             	lea    -0x2c(%ebp),%edx
f010bfe8:	89 74 24 04          	mov    %esi,0x4(%esp)
f010bfec:	c7 04 24 44 00 00 00 	movl   $0x44,(%esp)
f010bff3:	b8 64 e2 10 f0       	mov    $0xf010e264,%eax
f010bff8:	e8 73 fd ff ff       	call   f010bd70 <_ZL14stab_binsearchPK4StabPiS2_ij>
     	if(lline <= rline)
f010bffd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
f010c000:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010c005:	3b 55 d0             	cmp    -0x30(%ebp),%edx
f010c008:	0f 8f 7f 00 00 00    	jg     f010c08d <_Z13debuginfo_eipjP12Eipdebuginfo+0x203>
              info->eip_line = stabs[lline].n_desc;
f010c00e:	6b d2 0c             	imul   $0xc,%edx,%edx
f010c011:	0f b7 82 6a e2 10 f0 	movzwl -0xfef1d96(%edx),%eax
f010c018:	89 43 04             	mov    %eax,0x4(%ebx)
	// Search backwards from the line number for the relevant filename
	// stab.
	// We can't just use the "lfile" stab because inlined functions
	// can interpolate code from a different file!
	// Such included source files use the N_SOL stab type.
	while (lline >= lfile
f010c01b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f010c01e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f010c021:	6b d0 0c             	imul   $0xc,%eax,%edx
f010c024:	81 c2 6c e2 10 f0    	add    $0xf010e26c,%edx
f010c02a:	89 c6                	mov    %eax,%esi
f010c02c:	39 f8                	cmp    %edi,%eax
f010c02e:	7c 22                	jl     f010c052 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1c8>
f010c030:	0f b6 4a fc          	movzbl -0x4(%edx),%ecx
f010c034:	80 f9 84             	cmp    $0x84,%cl
f010c037:	74 61                	je     f010c09a <_Z13debuginfo_eipjP12Eipdebuginfo+0x210>
f010c039:	80 f9 64             	cmp    $0x64,%cl
f010c03c:	75 05                	jne    f010c043 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1b9>
f010c03e:	83 3a 00             	cmpl   $0x0,(%edx)
f010c041:	75 57                	jne    f010c09a <_Z13debuginfo_eipjP12Eipdebuginfo+0x210>
f010c043:	83 e8 01             	sub    $0x1,%eax
f010c046:	83 ea 0c             	sub    $0xc,%edx
f010c049:	eb df                	jmp    f010c02a <_Z13debuginfo_eipjP12Eipdebuginfo+0x1a0>
	       && stabs[lline].n_type != N_SOL
	       && (stabs[lline].n_type != N_SO || !stabs[lline].n_value))
		lline--;
	if (lline >= lfile
	    && stabs[lline].n_strx < (uint32_t) (stabstr_end - stabstr))
		info->eip_file = stabstr + stabs[lline].n_strx;
f010c04b:	05 9d 4f 11 f0       	add    $0xf0114f9d,%eax
f010c050:	89 03                	mov    %eax,(%ebx)


	// Set eip_fn_narg to the number of arguments taken by the function,
	// or 0 if there was no containing function.
	// Your code here.
 	if (lfun < rfun)
f010c052:	8b 45 dc             	mov    -0x24(%ebp),%eax
f010c055:	3b 45 d8             	cmp    -0x28(%ebp),%eax
f010c058:	7d 2e                	jge    f010c088 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1fe>
   	for (lline = lfun + 1; lline < rfun && stabs[lline].n_type == N_PSYM; lline++)
f010c05a:	83 c0 01             	add    $0x1,%eax
f010c05d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f010c060:	ba 64 e2 10 f0       	mov    $0xf010e264,%edx
f010c065:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f010c068:	3b 45 d8             	cmp    -0x28(%ebp),%eax
f010c06b:	7d 1b                	jge    f010c088 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1fe>
f010c06d:	6b c0 0c             	imul   $0xc,%eax,%eax
f010c070:	80 7c 10 04 a0       	cmpb   $0xa0,0x4(%eax,%edx,1)
f010c075:	75 11                	jne    f010c088 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1fe>
	    info->eip_fn_narg++;
f010c077:	83 43 14 01          	addl   $0x1,0x14(%ebx)

	// Set eip_fn_narg to the number of arguments taken by the function,
	// or 0 if there was no containing function.
	// Your code here.
 	if (lfun < rfun)
   	for (lline = lfun + 1; lline < rfun && stabs[lline].n_type == N_PSYM; lline++)
f010c07b:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
f010c07f:	eb e4                	jmp    f010c065 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1db>
f010c081:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010c086:	eb 05                	jmp    f010c08d <_Z13debuginfo_eipjP12Eipdebuginfo+0x203>
f010c088:	b8 00 00 00 00       	mov    $0x0,%eax
	    info->eip_fn_narg++;
	return 0;
}
f010c08d:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010c090:	8b 75 f8             	mov    -0x8(%ebp),%esi
f010c093:	8b 7d fc             	mov    -0x4(%ebp),%edi
f010c096:	89 ec                	mov    %ebp,%esp
f010c098:	5d                   	pop    %ebp
f010c099:	c3                   	ret    
	// Such included source files use the N_SOL stab type.
	while (lline >= lfile
	       && stabs[lline].n_type != N_SOL
	       && (stabs[lline].n_type != N_SO || !stabs[lline].n_value))
		lline--;
	if (lline >= lfile
f010c09a:	6b c6 0c             	imul   $0xc,%esi,%eax
f010c09d:	8b 80 64 e2 10 f0    	mov    -0xfef1d9c(%eax),%eax
f010c0a3:	ba ba 80 11 f0       	mov    $0xf01180ba,%edx
f010c0a8:	81 ea 9d 4f 11 f0    	sub    $0xf0114f9d,%edx
f010c0ae:	39 d0                	cmp    %edx,%eax
f010c0b0:	72 99                	jb     f010c04b <_Z13debuginfo_eipjP12Eipdebuginfo+0x1c1>
f010c0b2:	eb 9e                	jmp    f010c052 <_Z13debuginfo_eipjP12Eipdebuginfo+0x1c8>
	...

f010c0c0 <_ZL8printnumPFviPvES_yjii>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
f010c0c0:	55                   	push   %ebp
f010c0c1:	89 e5                	mov    %esp,%ebp
f010c0c3:	57                   	push   %edi
f010c0c4:	56                   	push   %esi
f010c0c5:	53                   	push   %ebx
f010c0c6:	83 ec 4c             	sub    $0x4c,%esp
f010c0c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010c0cc:	89 d6                	mov    %edx,%esi
f010c0ce:	8b 45 08             	mov    0x8(%ebp),%eax
f010c0d1:	89 45 d8             	mov    %eax,-0x28(%ebp)
f010c0d4:	8b 55 0c             	mov    0xc(%ebp),%edx
f010c0d7:	89 55 e0             	mov    %edx,-0x20(%ebp)
f010c0da:	8b 45 10             	mov    0x10(%ebp),%eax
f010c0dd:	8b 5d 14             	mov    0x14(%ebp),%ebx
f010c0e0:	8b 7d 18             	mov    0x18(%ebp),%edi
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
f010c0e3:	89 45 dc             	mov    %eax,-0x24(%ebp)
f010c0e6:	b9 00 00 00 00       	mov    $0x0,%ecx
f010c0eb:	39 d1                	cmp    %edx,%ecx
f010c0ed:	72 15                	jb     f010c104 <_ZL8printnumPFviPvES_yjii+0x44>
f010c0ef:	77 07                	ja     f010c0f8 <_ZL8printnumPFviPvES_yjii+0x38>
f010c0f1:	8b 55 d8             	mov    -0x28(%ebp),%edx
f010c0f4:	39 d0                	cmp    %edx,%eax
f010c0f6:	76 0c                	jbe    f010c104 <_ZL8printnumPFviPvES_yjii+0x44>
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
f010c0f8:	83 eb 01             	sub    $0x1,%ebx
f010c0fb:	85 db                	test   %ebx,%ebx
f010c0fd:	8d 76 00             	lea    0x0(%esi),%esi
f010c100:	7f 61                	jg     f010c163 <_ZL8printnumPFviPvES_yjii+0xa3>
f010c102:	eb 70                	jmp    f010c174 <_ZL8printnumPFviPvES_yjii+0xb4>
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
f010c104:	89 7c 24 10          	mov    %edi,0x10(%esp)
f010c108:	83 eb 01             	sub    $0x1,%ebx
f010c10b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
f010c10f:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c113:	8b 4c 24 08          	mov    0x8(%esp),%ecx
f010c117:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
f010c11b:	89 4d d0             	mov    %ecx,-0x30(%ebp)
f010c11e:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
f010c121:	8b 5d dc             	mov    -0x24(%ebp),%ebx
f010c124:	89 5c 24 08          	mov    %ebx,0x8(%esp)
f010c128:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010c12f:	00 
f010c130:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010c133:	89 04 24             	mov    %eax,(%esp)
f010c136:	8b 55 e0             	mov    -0x20(%ebp),%edx
f010c139:	89 54 24 04          	mov    %edx,0x4(%esp)
f010c13d:	e8 fe 09 00 00       	call   f010cb40 <__udivdi3>
f010c142:	8b 4d d0             	mov    -0x30(%ebp),%ecx
f010c145:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
f010c148:	89 4c 24 08          	mov    %ecx,0x8(%esp)
f010c14c:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
f010c150:	89 04 24             	mov    %eax,(%esp)
f010c153:	89 54 24 04          	mov    %edx,0x4(%esp)
f010c157:	89 f2                	mov    %esi,%edx
f010c159:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f010c15c:	e8 5f ff ff ff       	call   f010c0c0 <_ZL8printnumPFviPvES_yjii>
f010c161:	eb 11                	jmp    f010c174 <_ZL8printnumPFviPvES_yjii+0xb4>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
f010c163:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c167:	89 3c 24             	mov    %edi,(%esp)
f010c16a:	ff 55 e4             	call   *-0x1c(%ebp)
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
		printnum(putch, putdat, num / base, base, width - 1, padc);
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
f010c16d:	83 eb 01             	sub    $0x1,%ebx
f010c170:	85 db                	test   %ebx,%ebx
f010c172:	7f ef                	jg     f010c163 <_ZL8printnumPFviPvES_yjii+0xa3>
			putch(padc, putdat);
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
f010c174:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c178:	8b 74 24 04          	mov    0x4(%esp),%esi
f010c17c:	8b 45 dc             	mov    -0x24(%ebp),%eax
f010c17f:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c183:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
f010c18a:	00 
f010c18b:	8b 55 d8             	mov    -0x28(%ebp),%edx
f010c18e:	89 14 24             	mov    %edx,(%esp)
f010c191:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f010c194:	89 4c 24 04          	mov    %ecx,0x4(%esp)
f010c198:	e8 e3 0a 00 00       	call   f010cc80 <__umoddi3>
f010c19d:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c1a1:	0f be 80 55 e0 10 f0 	movsbl -0xfef1fab(%eax),%eax
f010c1a8:	89 04 24             	mov    %eax,(%esp)
f010c1ab:	ff 55 e4             	call   *-0x1c(%ebp)
}
f010c1ae:	83 c4 4c             	add    $0x4c,%esp
f010c1b1:	5b                   	pop    %ebx
f010c1b2:	5e                   	pop    %esi
f010c1b3:	5f                   	pop    %edi
f010c1b4:	5d                   	pop    %ebp
f010c1b5:	c3                   	ret    

f010c1b6 <_ZL7getuintPPci>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
f010c1b6:	55                   	push   %ebp
f010c1b7:	89 e5                	mov    %esp,%ebp
	if (lflag >= 2)
f010c1b9:	83 fa 01             	cmp    $0x1,%edx
f010c1bc:	7e 0f                	jle    f010c1cd <_ZL7getuintPPci+0x17>
		return va_arg(*ap, unsigned long long);
f010c1be:	8b 10                	mov    (%eax),%edx
f010c1c0:	83 c2 08             	add    $0x8,%edx
f010c1c3:	89 10                	mov    %edx,(%eax)
f010c1c5:	8b 42 f8             	mov    -0x8(%edx),%eax
f010c1c8:	8b 52 fc             	mov    -0x4(%edx),%edx
f010c1cb:	eb 24                	jmp    f010c1f1 <_ZL7getuintPPci+0x3b>
	else if (lflag)
f010c1cd:	85 d2                	test   %edx,%edx
f010c1cf:	74 11                	je     f010c1e2 <_ZL7getuintPPci+0x2c>
		return va_arg(*ap, unsigned long);
f010c1d1:	8b 10                	mov    (%eax),%edx
f010c1d3:	83 c2 04             	add    $0x4,%edx
f010c1d6:	89 10                	mov    %edx,(%eax)
f010c1d8:	8b 42 fc             	mov    -0x4(%edx),%eax
f010c1db:	ba 00 00 00 00       	mov    $0x0,%edx
f010c1e0:	eb 0f                	jmp    f010c1f1 <_ZL7getuintPPci+0x3b>
	else
		return va_arg(*ap, unsigned int);
f010c1e2:	8b 10                	mov    (%eax),%edx
f010c1e4:	83 c2 04             	add    $0x4,%edx
f010c1e7:	89 10                	mov    %edx,(%eax)
f010c1e9:	8b 42 fc             	mov    -0x4(%edx),%eax
f010c1ec:	ba 00 00 00 00       	mov    $0x0,%edx
}
f010c1f1:	5d                   	pop    %ebp
f010c1f2:	c3                   	ret    

f010c1f3 <_ZL11sprintputchiPv>:
	int cnt;
};

static void
sprintputch(int ch, void *thunk)
{
f010c1f3:	55                   	push   %ebp
f010c1f4:	89 e5                	mov    %esp,%ebp
	struct sprintbuf *b = (struct sprintbuf *) thunk;
f010c1f6:	8b 45 0c             	mov    0xc(%ebp),%eax
	b->cnt++;
f010c1f9:	83 40 08 01          	addl   $0x1,0x8(%eax)
	if (b->buf < b->ebuf)
f010c1fd:	8b 10                	mov    (%eax),%edx
f010c1ff:	3b 50 04             	cmp    0x4(%eax),%edx
f010c202:	73 0a                	jae    f010c20e <_ZL11sprintputchiPv+0x1b>
		*b->buf++ = ch;
f010c204:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010c207:	88 0a                	mov    %cl,(%edx)
f010c209:	83 c2 01             	add    $0x1,%edx
f010c20c:	89 10                	mov    %edx,(%eax)
}
f010c20e:	5d                   	pop    %ebp
f010c20f:	c3                   	ret    

f010c210 <_Z9vprintfmtPFviPvES_PKcPc>:
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
f010c210:	55                   	push   %ebp
f010c211:	89 e5                	mov    %esp,%ebp
f010c213:	57                   	push   %edi
f010c214:	56                   	push   %esi
f010c215:	53                   	push   %ebx
f010c216:	83 ec 5c             	sub    $0x5c,%esp
f010c219:	8b 7d 08             	mov    0x8(%ebp),%edi
f010c21c:	8b 75 0c             	mov    0xc(%ebp),%esi
f010c21f:	8b 5d 10             	mov    0x10(%ebp),%ebx
		case '#':
			altflag = 1;
			goto reswitch;

		process_precision:
			if (width < 0)
f010c222:	c7 45 c4 ff ff ff ff 	movl   $0xffffffff,-0x3c(%ebp)
f010c229:	eb 03                	jmp    f010c22e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
// Main function to format and print a string.
void printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...);

void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap)
{
f010c22b:	8b 5d cc             	mov    -0x34(%ebp),%ebx
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
f010c22e:	0f b6 03             	movzbl (%ebx),%eax
f010c231:	83 c3 01             	add    $0x1,%ebx
f010c234:	83 f8 25             	cmp    $0x25,%eax
f010c237:	74 29                	je     f010c262 <_Z9vprintfmtPFviPvES_PKcPc+0x52>
			if (ch == '\0')
f010c239:	85 c0                	test   %eax,%eax
f010c23b:	75 11                	jne    f010c24e <_Z9vprintfmtPFviPvES_PKcPc+0x3e>
f010c23d:	e9 e0 03 00 00       	jmp    f010c622 <_Z9vprintfmtPFviPvES_PKcPc+0x412>
f010c242:	85 c0                	test   %eax,%eax
f010c244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c248:	0f 84 d4 03 00 00    	je     f010c622 <_Z9vprintfmtPFviPvES_PKcPc+0x412>
				return;
			putch(ch, putdat);
f010c24e:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c252:	89 04 24             	mov    %eax,(%esp)
f010c255:	ff d7                	call   *%edi
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
f010c257:	0f b6 03             	movzbl (%ebx),%eax
f010c25a:	83 c3 01             	add    $0x1,%ebx
f010c25d:	83 f8 25             	cmp    $0x25,%eax
f010c260:	75 e0                	jne    f010c242 <_Z9vprintfmtPFviPvES_PKcPc+0x32>
f010c262:	c6 45 d0 20          	movb   $0x20,-0x30(%ebp)
f010c266:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
f010c26d:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
f010c274:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
f010c27b:	b9 00 00 00 00       	mov    $0x0,%ecx
f010c280:	eb 06                	jmp    f010c288 <_Z9vprintfmtPFviPvES_PKcPc+0x78>
f010c282:	c6 45 d0 2d          	movb   $0x2d,-0x30(%ebp)
f010c286:	89 c3                	mov    %eax,%ebx
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
f010c288:	0f b6 13             	movzbl (%ebx),%edx
f010c28b:	0f b6 c2             	movzbl %dl,%eax
f010c28e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f010c291:	8d 43 01             	lea    0x1(%ebx),%eax
f010c294:	83 ea 23             	sub    $0x23,%edx
f010c297:	80 fa 55             	cmp    $0x55,%dl
f010c29a:	0f 87 45 03 00 00    	ja     f010c5e5 <_Z9vprintfmtPFviPvES_PKcPc+0x3d5>
f010c2a0:	0f b6 d2             	movzbl %dl,%edx
f010c2a3:	ff 24 95 e0 e0 10 f0 	jmp    *-0xfef1f20(,%edx,4)
f010c2aa:	c6 45 d0 30          	movb   $0x30,-0x30(%ebp)
f010c2ae:	eb d6                	jmp    f010c286 <_Z9vprintfmtPFviPvES_PKcPc+0x76>
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
				precision = precision * 10 + ch - '0';
f010c2b0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
f010c2b3:	83 ea 30             	sub    $0x30,%edx
f010c2b6:	89 55 d8             	mov    %edx,-0x28(%ebp)
				ch = *fmt;
f010c2b9:	0f be 10             	movsbl (%eax),%edx
				if (ch < '0' || ch > '9')
f010c2bc:	8d 5a d0             	lea    -0x30(%edx),%ebx
f010c2bf:	83 fb 09             	cmp    $0x9,%ebx
f010c2c2:	77 4d                	ja     f010c311 <_Z9vprintfmtPFviPvES_PKcPc+0x101>
f010c2c4:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
f010c2c7:	8b 4d d8             	mov    -0x28(%ebp),%ecx
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			for (precision = 0; ; ++fmt) {
f010c2ca:	83 c0 01             	add    $0x1,%eax
				precision = precision * 10 + ch - '0';
f010c2cd:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
f010c2d0:	8d 4c 4a d0          	lea    -0x30(%edx,%ecx,2),%ecx
				ch = *fmt;
f010c2d4:	0f be 10             	movsbl (%eax),%edx
				if (ch < '0' || ch > '9')
f010c2d7:	8d 5a d0             	lea    -0x30(%edx),%ebx
f010c2da:	83 fb 09             	cmp    $0x9,%ebx
f010c2dd:	76 eb                	jbe    f010c2ca <_Z9vprintfmtPFviPvES_PKcPc+0xba>
f010c2df:	89 4d d8             	mov    %ecx,-0x28(%ebp)
f010c2e2:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f010c2e5:	eb 2a                	jmp    f010c311 <_Z9vprintfmtPFviPvES_PKcPc+0x101>
					break;
			}
			goto process_precision;

		case '*':
			precision = va_arg(ap, int);
f010c2e7:	8b 55 14             	mov    0x14(%ebp),%edx
f010c2ea:	83 c2 04             	add    $0x4,%edx
f010c2ed:	89 55 14             	mov    %edx,0x14(%ebp)
f010c2f0:	8b 52 fc             	mov    -0x4(%edx),%edx
f010c2f3:	89 55 d8             	mov    %edx,-0x28(%ebp)
			goto process_precision;
f010c2f6:	eb 19                	jmp    f010c311 <_Z9vprintfmtPFviPvES_PKcPc+0x101>

		case '.':
			if (width < 0)
f010c2f8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010c2fb:	c1 fa 1f             	sar    $0x1f,%edx
f010c2fe:	f7 d2                	not    %edx
f010c300:	21 55 e4             	and    %edx,-0x1c(%ebp)
f010c303:	eb 81                	jmp    f010c286 <_Z9vprintfmtPFviPvES_PKcPc+0x76>
f010c305:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
				width = 0;
			goto reswitch;

		case '#':
			altflag = 1;
			goto reswitch;
f010c30c:	e9 75 ff ff ff       	jmp    f010c286 <_Z9vprintfmtPFviPvES_PKcPc+0x76>

		process_precision:
			if (width < 0)
f010c311:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
f010c315:	0f 89 6b ff ff ff    	jns    f010c286 <_Z9vprintfmtPFviPvES_PKcPc+0x76>
f010c31b:	8b 55 d8             	mov    -0x28(%ebp),%edx
f010c31e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f010c321:	8b 55 c4             	mov    -0x3c(%ebp),%edx
f010c324:	89 55 d8             	mov    %edx,-0x28(%ebp)
f010c327:	e9 5a ff ff ff       	jmp    f010c286 <_Z9vprintfmtPFviPvES_PKcPc+0x76>
				width = precision, precision = -1;
			goto reswitch;

		// long flag (doubled for long long)
		case 'l':
			lflag++;
f010c32c:	83 c1 01             	add    $0x1,%ecx
			goto reswitch;
f010c32f:	e9 52 ff ff ff       	jmp    f010c286 <_Z9vprintfmtPFviPvES_PKcPc+0x76>
f010c334:	89 45 cc             	mov    %eax,-0x34(%ebp)

		// character
		case 'c':
			putch(va_arg(ap, int), putdat);
f010c337:	8b 45 14             	mov    0x14(%ebp),%eax
f010c33a:	83 c0 04             	add    $0x4,%eax
f010c33d:	89 45 14             	mov    %eax,0x14(%ebp)
f010c340:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c344:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c347:	89 04 24             	mov    %eax,(%esp)
f010c34a:	ff d7                	call   *%edi
f010c34c:	8b 5d cc             	mov    -0x34(%ebp),%ebx
			break;
f010c34f:	e9 da fe ff ff       	jmp    f010c22e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
f010c354:	89 45 cc             	mov    %eax,-0x34(%ebp)

		// error message
		case 'e':
			err = va_arg(ap, int);
f010c357:	8b 45 14             	mov    0x14(%ebp),%eax
f010c35a:	83 c0 04             	add    $0x4,%eax
f010c35d:	89 45 14             	mov    %eax,0x14(%ebp)
f010c360:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c363:	89 c2                	mov    %eax,%edx
f010c365:	c1 fa 1f             	sar    $0x1f,%edx
f010c368:	31 d0                	xor    %edx,%eax
f010c36a:	29 d0                	sub    %edx,%eax
			if (err < 0)
				err = -err;
			if (err > MAXERROR || (p = error_string[err]) == NULL)
f010c36c:	83 f8 06             	cmp    $0x6,%eax
f010c36f:	7f 0f                	jg     f010c380 <_Z9vprintfmtPFviPvES_PKcPc+0x170>
f010c371:	8b 14 85 38 e2 10 f0 	mov    -0xfef1dc8(,%eax,4),%edx
f010c378:	85 d2                	test   %edx,%edx
f010c37a:	0f 85 82 02 00 00    	jne    f010c602 <_Z9vprintfmtPFviPvES_PKcPc+0x3f2>
				printfmt(putch, putdat, "error %d", err);
f010c380:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c384:	c7 44 24 08 66 e0 10 	movl   $0xf010e066,0x8(%esp)
f010c38b:	f0 
f010c38c:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c390:	89 3c 24             	mov    %edi,(%esp)
f010c393:	e8 12 03 00 00       	call   f010c6aa <_Z8printfmtPFviPvES_PKcz>
f010c398:	8b 5d cc             	mov    -0x34(%ebp),%ebx
f010c39b:	e9 8e fe ff ff       	jmp    f010c22e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
f010c3a0:	89 45 cc             	mov    %eax,-0x34(%ebp)
f010c3a3:	8b 55 d8             	mov    -0x28(%ebp),%edx
f010c3a6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f010c3a9:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
				printfmt(putch, putdat, "%s", p);
			break;

		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
f010c3ac:	8b 45 14             	mov    0x14(%ebp),%eax
f010c3af:	83 c0 04             	add    $0x4,%eax
f010c3b2:	89 45 14             	mov    %eax,0x14(%ebp)
f010c3b5:	8b 58 fc             	mov    -0x4(%eax),%ebx
f010c3b8:	85 db                	test   %ebx,%ebx
f010c3ba:	75 05                	jne    f010c3c1 <_Z9vprintfmtPFviPvES_PKcPc+0x1b1>
f010c3bc:	bb 6f e0 10 f0       	mov    $0xf010e06f,%ebx
				p = "(null)";
			if (width > 0 && padc != '-')
f010c3c1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
f010c3c5:	7e 6d                	jle    f010c434 <_Z9vprintfmtPFviPvES_PKcPc+0x224>
f010c3c7:	80 7d d0 2d          	cmpb   $0x2d,-0x30(%ebp)
f010c3cb:	74 67                	je     f010c434 <_Z9vprintfmtPFviPvES_PKcPc+0x224>
				for (width -= strnlen(p, precision); width > 0; width--)
f010c3cd:	89 54 24 04          	mov    %edx,0x4(%esp)
f010c3d1:	89 1c 24             	mov    %ebx,(%esp)
f010c3d4:	e8 f2 03 00 00       	call   f010c7cb <_Z7strnlenPKcj>
f010c3d9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
f010c3dc:	29 c2                	sub    %eax,%edx
f010c3de:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f010c3e1:	85 d2                	test   %edx,%edx
f010c3e3:	7e 4f                	jle    f010c434 <_Z9vprintfmtPFviPvES_PKcPc+0x224>
					putch(padc, putdat);
f010c3e5:	0f be 4d d0          	movsbl -0x30(%ebp),%ecx
f010c3e9:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
f010c3ec:	89 5d d0             	mov    %ebx,-0x30(%ebp)
f010c3ef:	89 d3                	mov    %edx,%ebx
f010c3f1:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c3f5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f010c3f8:	89 04 24             	mov    %eax,(%esp)
f010c3fb:	ff d7                	call   *%edi
		// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
f010c3fd:	83 eb 01             	sub    $0x1,%ebx
f010c400:	85 db                	test   %ebx,%ebx
f010c402:	7f ed                	jg     f010c3f1 <_Z9vprintfmtPFviPvES_PKcPc+0x1e1>
f010c404:	8b 5d d0             	mov    -0x30(%ebp),%ebx
f010c407:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
f010c40e:	eb 24                	jmp    f010c434 <_Z9vprintfmtPFviPvES_PKcPc+0x224>
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
f010c410:	8d 50 e0             	lea    -0x20(%eax),%edx
f010c413:	83 fa 5e             	cmp    $0x5e,%edx
f010c416:	76 0f                	jbe    f010c427 <_Z9vprintfmtPFviPvES_PKcPc+0x217>
					putch('?', putdat);
f010c418:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c41c:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
f010c423:	ff d7                	call   *%edi
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
f010c425:	eb 09                	jmp    f010c430 <_Z9vprintfmtPFviPvES_PKcPc+0x220>
					putch('?', putdat);
				else
					putch(ch, putdat);
f010c427:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c42b:	89 04 24             	mov    %eax,(%esp)
f010c42e:	ff d7                	call   *%edi
			if ((p = va_arg(ap, char *)) == NULL)
				p = "(null)";
			if (width > 0 && padc != '-')
				for (width -= strnlen(p, precision); width > 0; width--)
					putch(padc, putdat);
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
f010c430:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
f010c434:	0f be 03             	movsbl (%ebx),%eax
f010c437:	83 c3 01             	add    $0x1,%ebx
f010c43a:	85 c0                	test   %eax,%eax
f010c43c:	74 1c                	je     f010c45a <_Z9vprintfmtPFviPvES_PKcPc+0x24a>
f010c43e:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
f010c442:	78 06                	js     f010c44a <_Z9vprintfmtPFviPvES_PKcPc+0x23a>
f010c444:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
f010c448:	78 10                	js     f010c45a <_Z9vprintfmtPFviPvES_PKcPc+0x24a>
				if (altflag && (ch < ' ' || ch > '~'))
f010c44a:	83 7d c8 00          	cmpl   $0x0,-0x38(%ebp)
f010c44e:	66 90                	xchg   %ax,%ax
f010c450:	75 be                	jne    f010c410 <_Z9vprintfmtPFviPvES_PKcPc+0x200>
f010c452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010c458:	eb cd                	jmp    f010c427 <_Z9vprintfmtPFviPvES_PKcPc+0x217>
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
f010c45a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
f010c45e:	66 90                	xchg   %ax,%ax
f010c460:	0f 8e c5 fd ff ff    	jle    f010c22b <_Z9vprintfmtPFviPvES_PKcPc+0x1b>
f010c466:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
				putch(' ', putdat);
f010c469:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c46d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
f010c474:	ff d7                	call   *%edi
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
			for (; width > 0; width--)
f010c476:	83 eb 01             	sub    $0x1,%ebx
f010c479:	85 db                	test   %ebx,%ebx
f010c47b:	7f ec                	jg     f010c469 <_Z9vprintfmtPFviPvES_PKcPc+0x259>
f010c47d:	e9 a9 fd ff ff       	jmp    f010c22b <_Z9vprintfmtPFviPvES_PKcPc+0x1b>
f010c482:	89 45 cc             	mov    %eax,-0x34(%ebp)
// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
	if (lflag >= 2)
f010c485:	83 f9 01             	cmp    $0x1,%ecx
f010c488:	7e 17                	jle    f010c4a1 <_Z9vprintfmtPFviPvES_PKcPc+0x291>
		return va_arg(*ap, long long);
f010c48a:	8b 45 14             	mov    0x14(%ebp),%eax
f010c48d:	83 c0 08             	add    $0x8,%eax
f010c490:	89 45 14             	mov    %eax,0x14(%ebp)
f010c493:	8b 50 f8             	mov    -0x8(%eax),%edx
f010c496:	8b 48 fc             	mov    -0x4(%eax),%ecx
f010c499:	89 55 d8             	mov    %edx,-0x28(%ebp)
f010c49c:	89 4d dc             	mov    %ecx,-0x24(%ebp)
f010c49f:	eb 34                	jmp    f010c4d5 <_Z9vprintfmtPFviPvES_PKcPc+0x2c5>
	else if (lflag)
f010c4a1:	85 c9                	test   %ecx,%ecx
f010c4a3:	74 19                	je     f010c4be <_Z9vprintfmtPFviPvES_PKcPc+0x2ae>
		return va_arg(*ap, long);
f010c4a5:	8b 45 14             	mov    0x14(%ebp),%eax
f010c4a8:	83 c0 04             	add    $0x4,%eax
f010c4ab:	89 45 14             	mov    %eax,0x14(%ebp)
f010c4ae:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c4b1:	89 45 d8             	mov    %eax,-0x28(%ebp)
f010c4b4:	89 c1                	mov    %eax,%ecx
f010c4b6:	c1 f9 1f             	sar    $0x1f,%ecx
f010c4b9:	89 4d dc             	mov    %ecx,-0x24(%ebp)
f010c4bc:	eb 17                	jmp    f010c4d5 <_Z9vprintfmtPFviPvES_PKcPc+0x2c5>
	else
		return va_arg(*ap, int);
f010c4be:	8b 45 14             	mov    0x14(%ebp),%eax
f010c4c1:	83 c0 04             	add    $0x4,%eax
f010c4c4:	89 45 14             	mov    %eax,0x14(%ebp)
f010c4c7:	8b 40 fc             	mov    -0x4(%eax),%eax
f010c4ca:	89 45 d8             	mov    %eax,-0x28(%ebp)
f010c4cd:	89 c2                	mov    %eax,%edx
f010c4cf:	c1 fa 1f             	sar    $0x1f,%edx
f010c4d2:	89 55 dc             	mov    %edx,-0x24(%ebp)
				putch(' ', putdat);
			break;

		// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
f010c4d5:	8b 4d d8             	mov    -0x28(%ebp),%ecx
f010c4d8:	8b 5d dc             	mov    -0x24(%ebp),%ebx
f010c4db:	b8 0a 00 00 00       	mov    $0xa,%eax
			if ((long long) num < 0) {
f010c4e0:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
f010c4e4:	0f 89 b9 00 00 00    	jns    f010c5a3 <_Z9vprintfmtPFviPvES_PKcPc+0x393>
				putch('-', putdat);
f010c4ea:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c4ee:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
f010c4f5:	ff d7                	call   *%edi
				num = -(long long) num;
f010c4f7:	8b 4d d8             	mov    -0x28(%ebp),%ecx
f010c4fa:	8b 5d dc             	mov    -0x24(%ebp),%ebx
f010c4fd:	f7 d9                	neg    %ecx
f010c4ff:	83 d3 00             	adc    $0x0,%ebx
f010c502:	f7 db                	neg    %ebx
f010c504:	b8 0a 00 00 00       	mov    $0xa,%eax
f010c509:	e9 95 00 00 00       	jmp    f010c5a3 <_Z9vprintfmtPFviPvES_PKcPc+0x393>
f010c50e:	89 45 cc             	mov    %eax,-0x34(%ebp)
			base = 10;
			goto number;

		// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
f010c511:	89 ca                	mov    %ecx,%edx
f010c513:	8d 45 14             	lea    0x14(%ebp),%eax
f010c516:	e8 9b fc ff ff       	call   f010c1b6 <_ZL7getuintPPci>
f010c51b:	89 c1                	mov    %eax,%ecx
f010c51d:	89 d3                	mov    %edx,%ebx
f010c51f:	b8 0a 00 00 00       	mov    $0xa,%eax
			base = 10;
			goto number;
f010c524:	eb 7d                	jmp    f010c5a3 <_Z9vprintfmtPFviPvES_PKcPc+0x393>
f010c526:	89 45 cc             	mov    %eax,-0x34(%ebp)

		// (unsigned) octal
		case 'o':
			// Replace this with your code.
			putch('X', putdat);
f010c529:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c52d:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
f010c534:	ff d7                	call   *%edi
			putch('X', putdat);
f010c536:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c53a:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
f010c541:	ff d7                	call   *%edi
			putch('X', putdat);
f010c543:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c547:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
f010c54e:	ff d7                	call   *%edi
f010c550:	8b 5d cc             	mov    -0x34(%ebp),%ebx
			break;
f010c553:	e9 d6 fc ff ff       	jmp    f010c22e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
f010c558:	89 45 cc             	mov    %eax,-0x34(%ebp)

		// pointer
		case 'p':
			putch('0', putdat);
f010c55b:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c55f:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
f010c566:	ff d7                	call   *%edi
			putch('x', putdat);
f010c568:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c56c:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
f010c573:	ff d7                	call   *%edi
			num = (unsigned long long)
				(uintptr_t) va_arg(ap, void *);
f010c575:	8b 45 14             	mov    0x14(%ebp),%eax
f010c578:	83 c0 04             	add    $0x4,%eax
f010c57b:	89 45 14             	mov    %eax,0x14(%ebp)
f010c57e:	8b 48 fc             	mov    -0x4(%eax),%ecx
f010c581:	bb 00 00 00 00       	mov    $0x0,%ebx
f010c586:	b8 10 00 00 00       	mov    $0x10,%eax
			base = 16;
			goto number;
f010c58b:	eb 16                	jmp    f010c5a3 <_Z9vprintfmtPFviPvES_PKcPc+0x393>
f010c58d:	89 45 cc             	mov    %eax,-0x34(%ebp)

		// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
f010c590:	89 ca                	mov    %ecx,%edx
f010c592:	8d 45 14             	lea    0x14(%ebp),%eax
f010c595:	e8 1c fc ff ff       	call   f010c1b6 <_ZL7getuintPPci>
f010c59a:	89 c1                	mov    %eax,%ecx
f010c59c:	89 d3                	mov    %edx,%ebx
f010c59e:	b8 10 00 00 00       	mov    $0x10,%eax
			base = 16;
		number:
			printnum(putch, putdat, num, base, width, padc);
f010c5a3:	0f be 55 d0          	movsbl -0x30(%ebp),%edx
f010c5a7:	89 54 24 10          	mov    %edx,0x10(%esp)
f010c5ab:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f010c5ae:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010c5b2:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c5b6:	89 0c 24             	mov    %ecx,(%esp)
f010c5b9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
f010c5bd:	89 f2                	mov    %esi,%edx
f010c5bf:	89 f8                	mov    %edi,%eax
f010c5c1:	e8 fa fa ff ff       	call   f010c0c0 <_ZL8printnumPFviPvES_yjii>
f010c5c6:	8b 5d cc             	mov    -0x34(%ebp),%ebx
			break;
f010c5c9:	e9 60 fc ff ff       	jmp    f010c22e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
f010c5ce:	89 45 cc             	mov    %eax,-0x34(%ebp)
f010c5d1:	8b 55 d4             	mov    -0x2c(%ebp),%edx

		// escaped '%' character
		case '%':
			putch(ch, putdat);
f010c5d4:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c5d8:	89 14 24             	mov    %edx,(%esp)
f010c5db:	ff d7                	call   *%edi
f010c5dd:	8b 5d cc             	mov    -0x34(%ebp),%ebx
			break;
f010c5e0:	e9 49 fc ff ff       	jmp    f010c22e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
			
		// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
f010c5e5:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c5e9:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
f010c5f0:	ff d7                	call   *%edi
			for (fmt--; fmt[-1] != '%'; fmt--)
f010c5f2:	8d 43 ff             	lea    -0x1(%ebx),%eax
f010c5f5:	80 38 25             	cmpb   $0x25,(%eax)
f010c5f8:	0f 84 30 fc ff ff    	je     f010c22e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
f010c5fe:	89 c3                	mov    %eax,%ebx
f010c600:	eb f0                	jmp    f010c5f2 <_Z9vprintfmtPFviPvES_PKcPc+0x3e2>
			if (err < 0)
				err = -err;
			if (err > MAXERROR || (p = error_string[err]) == NULL)
				printfmt(putch, putdat, "error %d", err);
			else
				printfmt(putch, putdat, "%s", p);
f010c602:	89 54 24 0c          	mov    %edx,0xc(%esp)
f010c606:	c7 44 24 08 be da 10 	movl   $0xf010dabe,0x8(%esp)
f010c60d:	f0 
f010c60e:	89 74 24 04          	mov    %esi,0x4(%esp)
f010c612:	89 3c 24             	mov    %edi,(%esp)
f010c615:	e8 90 00 00 00       	call   f010c6aa <_Z8printfmtPFviPvES_PKcz>
f010c61a:	8b 5d cc             	mov    -0x34(%ebp),%ebx
f010c61d:	e9 0c fc ff ff       	jmp    f010c22e <_Z9vprintfmtPFviPvES_PKcPc+0x1e>
			for (fmt--; fmt[-1] != '%'; fmt--)
				/* do nothing */;
			break;
		}
	}
}
f010c622:	83 c4 5c             	add    $0x5c,%esp
f010c625:	5b                   	pop    %ebx
f010c626:	5e                   	pop    %esi
f010c627:	5f                   	pop    %edi
f010c628:	5d                   	pop    %ebp
f010c629:	c3                   	ret    

f010c62a <_Z9vsnprintfPciPKcS_>:
		*b->buf++ = ch;
}

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
f010c62a:	55                   	push   %ebp
f010c62b:	89 e5                	mov    %esp,%ebp
f010c62d:	83 ec 28             	sub    $0x28,%esp
f010c630:	8b 45 08             	mov    0x8(%ebp),%eax
f010c633:	8b 55 0c             	mov    0xc(%ebp),%edx
	struct sprintbuf b = {buf, buf+n-1, 0};

	if (buf == NULL || n < 1)
f010c636:	85 c0                	test   %eax,%eax
f010c638:	74 04                	je     f010c63e <_Z9vsnprintfPciPKcS_+0x14>
f010c63a:	85 d2                	test   %edx,%edx
f010c63c:	7f 07                	jg     f010c645 <_Z9vsnprintfPciPKcS_+0x1b>
f010c63e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f010c643:	eb 3b                	jmp    f010c680 <_Z9vsnprintfPciPKcS_+0x56>
}

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
	struct sprintbuf b = {buf, buf+n-1, 0};
f010c645:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
f010c64c:	89 45 ec             	mov    %eax,-0x14(%ebp)
f010c64f:	8d 44 10 ff          	lea    -0x1(%eax,%edx,1),%eax
f010c653:	89 45 f0             	mov    %eax,-0x10(%ebp)

	if (buf == NULL || n < 1)
		return -E_INVAL;

	// print the string to the buffer
	vprintfmt(sprintputch, &b, fmt, ap);
f010c656:	8b 45 14             	mov    0x14(%ebp),%eax
f010c659:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c65d:	8b 45 10             	mov    0x10(%ebp),%eax
f010c660:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c664:	8d 45 ec             	lea    -0x14(%ebp),%eax
f010c667:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c66b:	c7 04 24 f3 c1 10 f0 	movl   $0xf010c1f3,(%esp)
f010c672:	e8 99 fb ff ff       	call   f010c210 <_Z9vprintfmtPFviPvES_PKcPc>

	// null terminate the buffer
	*b.buf = '\0';
f010c677:	8b 45 ec             	mov    -0x14(%ebp),%eax
f010c67a:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
f010c67d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
f010c680:	c9                   	leave  
f010c681:	c3                   	ret    

f010c682 <_Z8snprintfPciPKcz>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
f010c682:	55                   	push   %ebp
f010c683:	89 e5                	mov    %esp,%ebp
f010c685:	83 ec 18             	sub    $0x18,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
	rc = vsnprintf(buf, n, fmt, ap);
f010c688:	8d 45 14             	lea    0x14(%ebp),%eax
f010c68b:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c68f:	8b 45 10             	mov    0x10(%ebp),%eax
f010c692:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c696:	8b 45 0c             	mov    0xc(%ebp),%eax
f010c699:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c69d:	8b 45 08             	mov    0x8(%ebp),%eax
f010c6a0:	89 04 24             	mov    %eax,(%esp)
f010c6a3:	e8 82 ff ff ff       	call   f010c62a <_Z9vsnprintfPciPKcS_>
	va_end(ap);

	return rc;
}
f010c6a8:	c9                   	leave  
f010c6a9:	c3                   	ret    

f010c6aa <_Z8printfmtPFviPvES_PKcz>:
	}
}

void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...)
{
f010c6aa:	55                   	push   %ebp
f010c6ab:	89 e5                	mov    %esp,%ebp
f010c6ad:	83 ec 18             	sub    $0x18,%esp
	va_list ap;

	va_start(ap, fmt);
	vprintfmt(putch, putdat, fmt, ap);
f010c6b0:	8d 45 14             	lea    0x14(%ebp),%eax
f010c6b3:	89 44 24 0c          	mov    %eax,0xc(%esp)
f010c6b7:	8b 45 10             	mov    0x10(%ebp),%eax
f010c6ba:	89 44 24 08          	mov    %eax,0x8(%esp)
f010c6be:	8b 45 0c             	mov    0xc(%ebp),%eax
f010c6c1:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c6c5:	8b 45 08             	mov    0x8(%ebp),%eax
f010c6c8:	89 04 24             	mov    %eax,(%esp)
f010c6cb:	e8 40 fb ff ff       	call   f010c210 <_Z9vprintfmtPFviPvES_PKcPc>
	va_end(ap);
}
f010c6d0:	c9                   	leave  
f010c6d1:	c3                   	ret    
	...

f010c6e0 <_Z8readlinePKc>:
#define BUFLEN 1024
static char buf[BUFLEN];

char *
readline(const char *prompt)
{
f010c6e0:	55                   	push   %ebp
f010c6e1:	89 e5                	mov    %esp,%ebp
f010c6e3:	57                   	push   %edi
f010c6e4:	56                   	push   %esi
f010c6e5:	53                   	push   %ebx
f010c6e6:	83 ec 1c             	sub    $0x1c,%esp
f010c6e9:	8b 45 08             	mov    0x8(%ebp),%eax
	int i, c, echoing;

	if (prompt != NULL)
f010c6ec:	85 c0                	test   %eax,%eax
f010c6ee:	74 10                	je     f010c700 <_Z8readlinePKc+0x20>
		cprintf("%s", prompt);
f010c6f0:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c6f4:	c7 04 24 be da 10 f0 	movl   $0xf010dabe,(%esp)
f010c6fb:	e8 77 f3 ff ff       	call   f010ba77 <_Z7cprintfPKcz>

	i = 0;
	echoing = (iscons(0) > 0);
f010c700:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f010c707:	e8 61 cb ff ff       	call   f010926d <_Z6isconsi>
f010c70c:	85 c0                	test   %eax,%eax
f010c70e:	0f 9f c0             	setg   %al
f010c711:	0f b6 f8             	movzbl %al,%edi
f010c714:	be 00 00 00 00       	mov    $0x0,%esi
	while (1) {
		c = getchar();
f010c719:	e8 3e cb ff ff       	call   f010925c <_Z7getcharv>
f010c71e:	89 c3                	mov    %eax,%ebx
		if (c < 0) {
f010c720:	85 c0                	test   %eax,%eax
f010c722:	79 17                	jns    f010c73b <_Z8readlinePKc+0x5b>
			cprintf("read error: %e\n", c);
f010c724:	89 44 24 04          	mov    %eax,0x4(%esp)
f010c728:	c7 04 24 54 e2 10 f0 	movl   $0xf010e254,(%esp)
f010c72f:	e8 43 f3 ff ff       	call   f010ba77 <_Z7cprintfPKcz>
f010c734:	b8 00 00 00 00       	mov    $0x0,%eax
			return NULL;
f010c739:	eb 6b                	jmp    f010c7a6 <_Z8readlinePKc+0xc6>
		} else if (c >= ' ' && i < BUFLEN-1) {
f010c73b:	83 f8 1f             	cmp    $0x1f,%eax
f010c73e:	7e 20                	jle    f010c760 <_Z8readlinePKc+0x80>
f010c740:	81 fe fe 03 00 00    	cmp    $0x3fe,%esi
f010c746:	7f 18                	jg     f010c760 <_Z8readlinePKc+0x80>
			if (echoing)
f010c748:	85 ff                	test   %edi,%edi
f010c74a:	74 09                	je     f010c755 <_Z8readlinePKc+0x75>
				cputchar(c);
f010c74c:	89 04 24             	mov    %eax,(%esp)
f010c74f:	90                   	nop
f010c750:	e8 ef d0 ff ff       	call   f0109844 <_Z8cputchari>
			buf[i++] = c;
f010c755:	88 9e 20 ec 11 f0    	mov    %bl,-0xfee13e0(%esi)
f010c75b:	83 c6 01             	add    $0x1,%esi
f010c75e:	eb b9                	jmp    f010c719 <_Z8readlinePKc+0x39>
		} else if (c == '\b' && i > 0) {
f010c760:	83 fb 08             	cmp    $0x8,%ebx
f010c763:	75 1a                	jne    f010c77f <_Z8readlinePKc+0x9f>
f010c765:	85 f6                	test   %esi,%esi
f010c767:	7e 16                	jle    f010c77f <_Z8readlinePKc+0x9f>
			if (echoing)
f010c769:	85 ff                	test   %edi,%edi
f010c76b:	90                   	nop
f010c76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c770:	74 08                	je     f010c77a <_Z8readlinePKc+0x9a>
				cputchar(c);
f010c772:	89 1c 24             	mov    %ebx,(%esp)
f010c775:	e8 ca d0 ff ff       	call   f0109844 <_Z8cputchari>
			i--;
f010c77a:	83 ee 01             	sub    $0x1,%esi
f010c77d:	eb 9a                	jmp    f010c719 <_Z8readlinePKc+0x39>
		} else if (c == '\n' || c == '\r') {
f010c77f:	83 fb 0a             	cmp    $0xa,%ebx
f010c782:	74 05                	je     f010c789 <_Z8readlinePKc+0xa9>
f010c784:	83 fb 0d             	cmp    $0xd,%ebx
f010c787:	75 90                	jne    f010c719 <_Z8readlinePKc+0x39>
			if (echoing)
f010c789:	85 ff                	test   %edi,%edi
f010c78b:	90                   	nop
f010c78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c790:	74 08                	je     f010c79a <_Z8readlinePKc+0xba>
				cputchar(c);
f010c792:	89 1c 24             	mov    %ebx,(%esp)
f010c795:	e8 aa d0 ff ff       	call   f0109844 <_Z8cputchari>
			buf[i] = 0;
f010c79a:	c6 86 20 ec 11 f0 00 	movb   $0x0,-0xfee13e0(%esi)
f010c7a1:	b8 20 ec 11 f0       	mov    $0xf011ec20,%eax
			return buf;
		}
	}
}
f010c7a6:	83 c4 1c             	add    $0x1c,%esp
f010c7a9:	5b                   	pop    %ebx
f010c7aa:	5e                   	pop    %esi
f010c7ab:	5f                   	pop    %edi
f010c7ac:	5d                   	pop    %ebp
f010c7ad:	c3                   	ret    
	...

f010c7b0 <_Z6strlenPKc>:

#include <inc/string.h>

int
strlen(const char *s)
{
f010c7b0:	55                   	push   %ebp
f010c7b1:	89 e5                	mov    %esp,%ebp
f010c7b3:	8b 55 08             	mov    0x8(%ebp),%edx
	int n;

	for (n = 0; *s != '\0'; s++)
f010c7b6:	b8 00 00 00 00       	mov    $0x0,%eax
f010c7bb:	80 3a 00             	cmpb   $0x0,(%edx)
f010c7be:	74 09                	je     f010c7c9 <_Z6strlenPKc+0x19>
		n++;
f010c7c0:	83 c0 01             	add    $0x1,%eax
int
strlen(const char *s)
{
	int n;

	for (n = 0; *s != '\0'; s++)
f010c7c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
f010c7c7:	75 f7                	jne    f010c7c0 <_Z6strlenPKc+0x10>
		n++;
	return n;
}
f010c7c9:	5d                   	pop    %ebp
f010c7ca:	c3                   	ret    

f010c7cb <_Z7strnlenPKcj>:

int
strnlen(const char *s, size_t size)
{
f010c7cb:	55                   	push   %ebp
f010c7cc:	89 e5                	mov    %esp,%ebp
f010c7ce:	53                   	push   %ebx
f010c7cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
f010c7d2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f010c7d5:	b8 00 00 00 00       	mov    $0x0,%eax
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
f010c7da:	39 c1                	cmp    %eax,%ecx
f010c7dc:	74 0b                	je     f010c7e9 <_Z7strnlenPKcj+0x1e>
f010c7de:	80 3c 03 00          	cmpb   $0x0,(%ebx,%eax,1)
f010c7e2:	74 05                	je     f010c7e9 <_Z7strnlenPKcj+0x1e>
		n++;
f010c7e4:	83 c0 01             	add    $0x1,%eax
f010c7e7:	eb f1                	jmp    f010c7da <_Z7strnlenPKcj+0xf>
	return n;
}
f010c7e9:	5b                   	pop    %ebx
f010c7ea:	5d                   	pop    %ebp
f010c7eb:	90                   	nop
f010c7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c7f0:	c3                   	ret    

f010c7f1 <_Z6strcpyPcPKc>:

char *
strcpy(char *dst, const char *src)
{
f010c7f1:	55                   	push   %ebp
f010c7f2:	89 e5                	mov    %esp,%ebp
f010c7f4:	53                   	push   %ebx
f010c7f5:	8b 45 08             	mov    0x8(%ebp),%eax
f010c7f8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010c7fb:	ba 00 00 00 00       	mov    $0x0,%edx
	char *ret = dst;

	while ((*dst++ = *src++) != '\0')
f010c800:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
f010c804:	88 0c 10             	mov    %cl,(%eax,%edx,1)
f010c807:	83 c2 01             	add    $0x1,%edx
f010c80a:	84 c9                	test   %cl,%cl
f010c80c:	75 f2                	jne    f010c800 <_Z6strcpyPcPKc+0xf>
		/* do nothing */;
	return ret;
}
f010c80e:	5b                   	pop    %ebx
f010c80f:	5d                   	pop    %ebp
f010c810:	c3                   	ret    

f010c811 <_Z7strncpyPcPKcj>:

char *
strncpy(char *dst, const char *src, size_t size)
{
f010c811:	55                   	push   %ebp
f010c812:	89 e5                	mov    %esp,%ebp
f010c814:	56                   	push   %esi
f010c815:	53                   	push   %ebx
f010c816:	8b 45 08             	mov    0x8(%ebp),%eax
f010c819:	8b 55 0c             	mov    0xc(%ebp),%edx
f010c81c:	8b 75 10             	mov    0x10(%ebp),%esi
	char *ret = dst;

	for (size_t i = 0; i < size; i++) {
f010c81f:	85 f6                	test   %esi,%esi
f010c821:	74 18                	je     f010c83b <_Z7strncpyPcPKcj+0x2a>
f010c823:	b9 00 00 00 00       	mov    $0x0,%ecx
		*dst++ = *src;
f010c828:	0f b6 1a             	movzbl (%edx),%ebx
f010c82b:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
f010c82e:	80 3a 01             	cmpb   $0x1,(%edx)
f010c831:	83 da ff             	sbb    $0xffffffff,%edx
char *
strncpy(char *dst, const char *src, size_t size)
{
	char *ret = dst;

	for (size_t i = 0; i < size; i++) {
f010c834:	83 c1 01             	add    $0x1,%ecx
f010c837:	39 ce                	cmp    %ecx,%esi
f010c839:	77 ed                	ja     f010c828 <_Z7strncpyPcPKcj+0x17>
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
}
f010c83b:	5b                   	pop    %ebx
f010c83c:	5e                   	pop    %esi
f010c83d:	5d                   	pop    %ebp
f010c83e:	c3                   	ret    

f010c83f <_Z7strlcpyPcPKcj>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
f010c83f:	55                   	push   %ebp
f010c840:	89 e5                	mov    %esp,%ebp
f010c842:	56                   	push   %esi
f010c843:	53                   	push   %ebx
f010c844:	8b 75 08             	mov    0x8(%ebp),%esi
f010c847:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f010c84a:	8b 55 10             	mov    0x10(%ebp),%edx
	char *dst_in = dst;

	if (size > 0) {
		while (--size > 0 && *src != '\0')
			*dst++ = *src++;
f010c84d:	89 f0                	mov    %esi,%eax
size_t
strlcpy(char *dst, const char *src, size_t size)
{
	char *dst_in = dst;

	if (size > 0) {
f010c84f:	85 d2                	test   %edx,%edx
f010c851:	74 17                	je     f010c86a <_Z7strlcpyPcPKcj+0x2b>
		while (--size > 0 && *src != '\0')
f010c853:	83 ea 01             	sub    $0x1,%edx
f010c856:	74 18                	je     f010c870 <_Z7strlcpyPcPKcj+0x31>
f010c858:	80 39 00             	cmpb   $0x0,(%ecx)
f010c85b:	74 13                	je     f010c870 <_Z7strlcpyPcPKcj+0x31>
			*dst++ = *src++;
f010c85d:	0f b6 19             	movzbl (%ecx),%ebx
f010c860:	88 18                	mov    %bl,(%eax)
f010c862:	83 c0 01             	add    $0x1,%eax
f010c865:	83 c1 01             	add    $0x1,%ecx
f010c868:	eb e9                	jmp    f010c853 <_Z7strlcpyPcPKcj+0x14>
f010c86a:	29 f0                	sub    %esi,%eax
		*dst = '\0';
	}
	return dst - dst_in;
}
f010c86c:	5b                   	pop    %ebx
f010c86d:	5e                   	pop    %esi
f010c86e:	5d                   	pop    %ebp
f010c86f:	c3                   	ret    
	char *dst_in = dst;

	if (size > 0) {
		while (--size > 0 && *src != '\0')
			*dst++ = *src++;
		*dst = '\0';
f010c870:	c6 00 00             	movb   $0x0,(%eax)
f010c873:	eb f5                	jmp    f010c86a <_Z7strlcpyPcPKcj+0x2b>

f010c875 <_Z6strcmpPKcS0_>:
	return dst - dst_in;
}

int
strcmp(const char *p, const char *q)
{
f010c875:	55                   	push   %ebp
f010c876:	89 e5                	mov    %esp,%ebp
f010c878:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010c87b:	8b 55 0c             	mov    0xc(%ebp),%edx
	while (*p && *p == *q)
f010c87e:	0f b6 01             	movzbl (%ecx),%eax
f010c881:	84 c0                	test   %al,%al
f010c883:	74 0c                	je     f010c891 <_Z6strcmpPKcS0_+0x1c>
f010c885:	3a 02                	cmp    (%edx),%al
f010c887:	75 08                	jne    f010c891 <_Z6strcmpPKcS0_+0x1c>
		p++, q++;
f010c889:	83 c1 01             	add    $0x1,%ecx
f010c88c:	83 c2 01             	add    $0x1,%edx
f010c88f:	eb ed                	jmp    f010c87e <_Z6strcmpPKcS0_+0x9>
f010c891:	0f b6 c0             	movzbl %al,%eax
f010c894:	0f b6 12             	movzbl (%edx),%edx
f010c897:	29 d0                	sub    %edx,%eax
	return (unsigned char) *p - (unsigned char) *q;
}
f010c899:	5d                   	pop    %ebp
f010c89a:	c3                   	ret    

f010c89b <_Z7strncmpPKcS0_j>:

int
strncmp(const char *p, const char *q, size_t n)
{
f010c89b:	55                   	push   %ebp
f010c89c:	89 e5                	mov    %esp,%ebp
f010c89e:	53                   	push   %ebx
f010c89f:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010c8a2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010c8a5:	8b 55 10             	mov    0x10(%ebp),%edx
	while (n > 0 && *p && *p == *q)
f010c8a8:	85 d2                	test   %edx,%edx
f010c8aa:	74 16                	je     f010c8c2 <_Z7strncmpPKcS0_j+0x27>
f010c8ac:	0f b6 01             	movzbl (%ecx),%eax
f010c8af:	84 c0                	test   %al,%al
f010c8b1:	74 17                	je     f010c8ca <_Z7strncmpPKcS0_j+0x2f>
f010c8b3:	3a 03                	cmp    (%ebx),%al
f010c8b5:	75 13                	jne    f010c8ca <_Z7strncmpPKcS0_j+0x2f>
		n--, p++, q++;
f010c8b7:	83 ea 01             	sub    $0x1,%edx
f010c8ba:	83 c1 01             	add    $0x1,%ecx
f010c8bd:	83 c3 01             	add    $0x1,%ebx
f010c8c0:	eb e6                	jmp    f010c8a8 <_Z7strncmpPKcS0_j+0xd>
f010c8c2:	b8 00 00 00 00       	mov    $0x0,%eax
	if (n == 0)
		return 0;
	else
		return (unsigned char) *p - (unsigned char) *q;
}
f010c8c7:	5b                   	pop    %ebx
f010c8c8:	5d                   	pop    %ebp
f010c8c9:	c3                   	ret    
	while (n > 0 && *p && *p == *q)
		n--, p++, q++;
	if (n == 0)
		return 0;
	else
		return (unsigned char) *p - (unsigned char) *q;
f010c8ca:	0f b6 01             	movzbl (%ecx),%eax
f010c8cd:	0f b6 13             	movzbl (%ebx),%edx
f010c8d0:	29 d0                	sub    %edx,%eax
f010c8d2:	eb f3                	jmp    f010c8c7 <_Z7strncmpPKcS0_j+0x2c>

f010c8d4 <_Z6strchrPKcc>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
f010c8d4:	55                   	push   %ebp
f010c8d5:	89 e5                	mov    %esp,%ebp
f010c8d7:	8b 45 08             	mov    0x8(%ebp),%eax
f010c8da:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
	for (; *s; s++)
f010c8de:	0f b6 10             	movzbl (%eax),%edx
f010c8e1:	84 d2                	test   %dl,%dl
f010c8e3:	74 17                	je     f010c8fc <_Z6strchrPKcc+0x28>
		if (*s == c)
f010c8e5:	38 ca                	cmp    %cl,%dl
f010c8e7:	75 09                	jne    f010c8f2 <_Z6strchrPKcc+0x1e>
f010c8e9:	eb 16                	jmp    f010c901 <_Z6strchrPKcc+0x2d>
f010c8eb:	38 ca                	cmp    %cl,%dl
f010c8ed:	8d 76 00             	lea    0x0(%esi),%esi
f010c8f0:	74 0f                	je     f010c901 <_Z6strchrPKcc+0x2d>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
f010c8f2:	83 c0 01             	add    $0x1,%eax
f010c8f5:	0f b6 10             	movzbl (%eax),%edx
f010c8f8:	84 d2                	test   %dl,%dl
f010c8fa:	75 ef                	jne    f010c8eb <_Z6strchrPKcc+0x17>
f010c8fc:	b8 00 00 00 00       	mov    $0x0,%eax
		if (*s == c)
			return (char *) s;
	return 0;
}
f010c901:	5d                   	pop    %ebp
f010c902:	c3                   	ret    

f010c903 <_Z7strfindPKcc>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
f010c903:	55                   	push   %ebp
f010c904:	89 e5                	mov    %esp,%ebp
f010c906:	8b 45 08             	mov    0x8(%ebp),%eax
f010c909:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
	for (; *s; s++)
f010c90d:	0f b6 10             	movzbl (%eax),%edx
f010c910:	84 d2                	test   %dl,%dl
f010c912:	74 18                	je     f010c92c <_Z7strfindPKcc+0x29>
		if (*s == c)
f010c914:	38 ca                	cmp    %cl,%dl
f010c916:	75 0a                	jne    f010c922 <_Z7strfindPKcc+0x1f>
f010c918:	eb 12                	jmp    f010c92c <_Z7strfindPKcc+0x29>
f010c91a:	38 ca                	cmp    %cl,%dl
f010c91c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010c920:	74 0a                	je     f010c92c <_Z7strfindPKcc+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
f010c922:	83 c0 01             	add    $0x1,%eax
f010c925:	0f b6 10             	movzbl (%eax),%edx
f010c928:	84 d2                	test   %dl,%dl
f010c92a:	75 ee                	jne    f010c91a <_Z7strfindPKcc+0x17>
		if (*s == c)
			break;
	return (char *) s;
}
f010c92c:	5d                   	pop    %ebp
f010c92d:	c3                   	ret    

f010c92e <_Z6memsetPvij>:


void *
memset(void *v, int c, size_t n)
{
f010c92e:	55                   	push   %ebp
f010c92f:	89 e5                	mov    %esp,%ebp
f010c931:	53                   	push   %ebx
f010c932:	8b 45 08             	mov    0x8(%ebp),%eax
f010c935:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f010c938:	8b 5d 10             	mov    0x10(%ebp),%ebx
	char *p = (char *) v;
	int m = n;

	while (--m >= 0)
f010c93b:	89 da                	mov    %ebx,%edx
f010c93d:	83 ea 01             	sub    $0x1,%edx
f010c940:	78 0e                	js     f010c950 <_Z6memsetPvij+0x22>


void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
f010c942:	89 c2                	mov    %eax,%edx
	return (char *) s;
}


void *
memset(void *v, int c, size_t n)
f010c944:	8d 1c 18             	lea    (%eax,%ebx,1),%ebx
{
	char *p = (char *) v;
	int m = n;

	while (--m >= 0)
		*p++ = c;
f010c947:	88 0a                	mov    %cl,(%edx)
f010c949:	83 c2 01             	add    $0x1,%edx
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	int m = n;

	while (--m >= 0)
f010c94c:	39 da                	cmp    %ebx,%edx
f010c94e:	75 f7                	jne    f010c947 <_Z6memsetPvij+0x19>
		*p++ = c;
	return v;
}
f010c950:	5b                   	pop    %ebx
f010c951:	5d                   	pop    %ebp
f010c952:	c3                   	ret    

f010c953 <_Z6memcpyPvPKvj>:

void *
memcpy(void *dst, const void *src, size_t n)
{
f010c953:	55                   	push   %ebp
f010c954:	89 e5                	mov    %esp,%ebp
f010c956:	56                   	push   %esi
f010c957:	53                   	push   %ebx
f010c958:	8b 45 08             	mov    0x8(%ebp),%eax
f010c95b:	8b 75 0c             	mov    0xc(%ebp),%esi
f010c95e:	8b 5d 10             	mov    0x10(%ebp),%ebx
	const char *s = (const char *) src;
	char *d = (char *) dst;

	while (n-- > 0)
f010c961:	85 db                	test   %ebx,%ebx
f010c963:	74 13                	je     f010c978 <_Z6memcpyPvPKvj+0x25>
f010c965:	ba 00 00 00 00       	mov    $0x0,%edx
		*d++ = *s++;
f010c96a:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
f010c96e:	88 0c 10             	mov    %cl,(%eax,%edx,1)
f010c971:	83 c2 01             	add    $0x1,%edx
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;

	while (n-- > 0)
f010c974:	39 da                	cmp    %ebx,%edx
f010c976:	75 f2                	jne    f010c96a <_Z6memcpyPvPKvj+0x17>
		*d++ = *s++;

	return dst;
}
f010c978:	5b                   	pop    %ebx
f010c979:	5e                   	pop    %esi
f010c97a:	5d                   	pop    %ebp
f010c97b:	c3                   	ret    

f010c97c <_Z7memmovePvPKvj>:

void *
memmove(void *dst, const void *src, size_t n)
{
f010c97c:	55                   	push   %ebp
f010c97d:	89 e5                	mov    %esp,%ebp
f010c97f:	57                   	push   %edi
f010c980:	56                   	push   %esi
f010c981:	53                   	push   %ebx
f010c982:	8b 45 08             	mov    0x8(%ebp),%eax
f010c985:	8b 75 0c             	mov    0xc(%ebp),%esi
f010c988:	8b 5d 10             	mov    0x10(%ebp),%ebx
	const char *s = (const char *) src;
f010c98b:	89 f7                	mov    %esi,%edi
	char *d = (char *) dst;

	if (s < d && s + n > d) {
f010c98d:	39 c6                	cmp    %eax,%esi
f010c98f:	72 0b                	jb     f010c99c <_Z7memmovePvPKvj+0x20>
		s += n;
		d += n;
		while (n-- > 0)
f010c991:	ba 00 00 00 00       	mov    $0x0,%edx
			*--d = *--s;
	} else
		while (n-- > 0)
f010c996:	85 db                	test   %ebx,%ebx
f010c998:	75 29                	jne    f010c9c3 <_Z7memmovePvPKvj+0x47>
f010c99a:	eb 35                	jmp    f010c9d1 <_Z7memmovePvPKvj+0x55>
memmove(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;

	if (s < d && s + n > d) {
f010c99c:	01 df                	add    %ebx,%edi
f010c99e:	39 f8                	cmp    %edi,%eax
f010c9a0:	73 ef                	jae    f010c991 <_Z7memmovePvPKvj+0x15>
		s += n;
		d += n;
		while (n-- > 0)
f010c9a2:	85 db                	test   %ebx,%ebx
f010c9a4:	74 2b                	je     f010c9d1 <_Z7memmovePvPKvj+0x55>
	const char *s = (const char *) src;
	char *d = (char *) dst;

	if (s < d && s + n > d) {
		s += n;
		d += n;
f010c9a6:	8d 34 18             	lea    (%eax,%ebx,1),%esi
f010c9a9:	ba 00 00 00 00       	mov    $0x0,%edx
		while (n-- > 0)
			*--d = *--s;
f010c9ae:	0f b6 4c 17 ff       	movzbl -0x1(%edi,%edx,1),%ecx
f010c9b3:	88 4c 16 ff          	mov    %cl,-0x1(%esi,%edx,1)
f010c9b7:	83 ea 01             	sub    $0x1,%edx
	char *d = (char *) dst;

	if (s < d && s + n > d) {
		s += n;
		d += n;
		while (n-- > 0)
f010c9ba:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
f010c9bd:	85 c9                	test   %ecx,%ecx
f010c9bf:	75 ed                	jne    f010c9ae <_Z7memmovePvPKvj+0x32>
f010c9c1:	eb 0e                	jmp    f010c9d1 <_Z7memmovePvPKvj+0x55>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
f010c9c3:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
f010c9c7:	88 0c 10             	mov    %cl,(%eax,%edx,1)
f010c9ca:	83 c2 01             	add    $0x1,%edx
		s += n;
		d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
f010c9cd:	39 d3                	cmp    %edx,%ebx
f010c9cf:	75 f2                	jne    f010c9c3 <_Z7memmovePvPKvj+0x47>
			*d++ = *s++;

	return dst;
}
f010c9d1:	5b                   	pop    %ebx
f010c9d2:	5e                   	pop    %esi
f010c9d3:	5f                   	pop    %edi
f010c9d4:	5d                   	pop    %ebp
f010c9d5:	c3                   	ret    

f010c9d6 <_Z6memcmpPKvS0_j>:

int
memcmp(const void *v1, const void *v2, size_t n)
{
f010c9d6:	55                   	push   %ebp
f010c9d7:	89 e5                	mov    %esp,%ebp
f010c9d9:	57                   	push   %edi
f010c9da:	56                   	push   %esi
f010c9db:	53                   	push   %ebx
f010c9dc:	8b 75 08             	mov    0x8(%ebp),%esi
f010c9df:	8b 7d 0c             	mov    0xc(%ebp),%edi
f010c9e2:	8b 4d 10             	mov    0x10(%ebp),%ecx
	const unsigned char *s1 = (const unsigned char *) v1;
	const unsigned char *s2 = (const unsigned char *) v2;

	while (n-- > 0) {
f010c9e5:	85 c9                	test   %ecx,%ecx
f010c9e7:	74 36                	je     f010ca1f <_Z6memcmpPKvS0_j+0x49>
		if (*s1 != *s2)
f010c9e9:	0f b6 06             	movzbl (%esi),%eax
f010c9ec:	0f b6 1f             	movzbl (%edi),%ebx
f010c9ef:	38 d8                	cmp    %bl,%al
f010c9f1:	74 20                	je     f010ca13 <_Z6memcmpPKvS0_j+0x3d>
f010c9f3:	eb 14                	jmp    f010ca09 <_Z6memcmpPKvS0_j+0x33>
f010c9f5:	0f b6 44 16 01       	movzbl 0x1(%esi,%edx,1),%eax
f010c9fa:	0f b6 5c 17 01       	movzbl 0x1(%edi,%edx,1),%ebx
f010c9ff:	83 c2 01             	add    $0x1,%edx
f010ca02:	83 e9 01             	sub    $0x1,%ecx
f010ca05:	38 d8                	cmp    %bl,%al
f010ca07:	74 12                	je     f010ca1b <_Z6memcmpPKvS0_j+0x45>
			return *s1 - *s2;
f010ca09:	0f b6 c0             	movzbl %al,%eax
f010ca0c:	0f b6 db             	movzbl %bl,%ebx
f010ca0f:	29 d8                	sub    %ebx,%eax
f010ca11:	eb 11                	jmp    f010ca24 <_Z6memcmpPKvS0_j+0x4e>
memcmp(const void *v1, const void *v2, size_t n)
{
	const unsigned char *s1 = (const unsigned char *) v1;
	const unsigned char *s2 = (const unsigned char *) v2;

	while (n-- > 0) {
f010ca13:	83 e9 01             	sub    $0x1,%ecx
f010ca16:	ba 00 00 00 00       	mov    $0x0,%edx
f010ca1b:	85 c9                	test   %ecx,%ecx
f010ca1d:	75 d6                	jne    f010c9f5 <_Z6memcmpPKvS0_j+0x1f>
f010ca1f:	b8 00 00 00 00       	mov    $0x0,%eax
		if (*s1 != *s2)
			return *s1 - *s2;
		s1++, s2++;
	}
	return 0;
}
f010ca24:	5b                   	pop    %ebx
f010ca25:	5e                   	pop    %esi
f010ca26:	5f                   	pop    %edi
f010ca27:	5d                   	pop    %ebp
f010ca28:	c3                   	ret    

f010ca29 <_Z7memfindPKvij>:

void *
memfind(const void *v, int c, size_t n)
{
f010ca29:	55                   	push   %ebp
f010ca2a:	89 e5                	mov    %esp,%ebp
	const unsigned char *s = (const unsigned char *) v;
f010ca2c:	8b 45 08             	mov    0x8(%ebp),%eax
	
	const unsigned char *ends = s + n;
f010ca2f:	89 c2                	mov    %eax,%edx
f010ca31:	03 55 10             	add    0x10(%ebp),%edx
	for (; s < ends; s++)
f010ca34:	39 d0                	cmp    %edx,%eax
f010ca36:	73 1a                	jae    f010ca52 <_Z7memfindPKvij+0x29>
		if (*s == (unsigned char) c)
f010ca38:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
f010ca3c:	38 08                	cmp    %cl,(%eax)
f010ca3e:	75 06                	jne    f010ca46 <_Z7memfindPKvij+0x1d>
f010ca40:	eb 10                	jmp    f010ca52 <_Z7memfindPKvij+0x29>
f010ca42:	38 08                	cmp    %cl,(%eax)
f010ca44:	74 0c                	je     f010ca52 <_Z7memfindPKvij+0x29>
memfind(const void *v, int c, size_t n)
{
	const unsigned char *s = (const unsigned char *) v;
	
	const unsigned char *ends = s + n;
	for (; s < ends; s++)
f010ca46:	83 c0 01             	add    $0x1,%eax
f010ca49:	39 c2                	cmp    %eax,%edx
f010ca4b:	90                   	nop
f010ca4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010ca50:	77 f0                	ja     f010ca42 <_Z7memfindPKvij+0x19>
		if (*s == (unsigned char) c)
			break;
	return (void *) s;
}
f010ca52:	5d                   	pop    %ebp
f010ca53:	c3                   	ret    

f010ca54 <_Z6strtolPKcPPci>:

long
strtol(const char *s, char **endptr, int base)
{
f010ca54:	55                   	push   %ebp
f010ca55:	89 e5                	mov    %esp,%ebp
f010ca57:	57                   	push   %edi
f010ca58:	56                   	push   %esi
f010ca59:	53                   	push   %ebx
f010ca5a:	83 ec 04             	sub    $0x4,%esp
f010ca5d:	8b 55 08             	mov    0x8(%ebp),%edx
f010ca60:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
f010ca63:	0f b6 02             	movzbl (%edx),%eax
f010ca66:	3c 20                	cmp    $0x20,%al
f010ca68:	74 04                	je     f010ca6e <_Z6strtolPKcPPci+0x1a>
f010ca6a:	3c 09                	cmp    $0x9,%al
f010ca6c:	75 0e                	jne    f010ca7c <_Z6strtolPKcPPci+0x28>
		s++;
f010ca6e:	83 c2 01             	add    $0x1,%edx
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
f010ca71:	0f b6 02             	movzbl (%edx),%eax
f010ca74:	3c 20                	cmp    $0x20,%al
f010ca76:	74 f6                	je     f010ca6e <_Z6strtolPKcPPci+0x1a>
f010ca78:	3c 09                	cmp    $0x9,%al
f010ca7a:	74 f2                	je     f010ca6e <_Z6strtolPKcPPci+0x1a>
		s++;

	// plus/minus sign
	if (*s == '+')
f010ca7c:	3c 2b                	cmp    $0x2b,%al
f010ca7e:	75 0c                	jne    f010ca8c <_Z6strtolPKcPPci+0x38>
		s++;
f010ca80:	83 c2 01             	add    $0x1,%edx
f010ca83:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
f010ca8a:	eb 15                	jmp    f010caa1 <_Z6strtolPKcPPci+0x4d>
	else if (*s == '-')
f010ca8c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
f010ca93:	3c 2d                	cmp    $0x2d,%al
f010ca95:	75 0a                	jne    f010caa1 <_Z6strtolPKcPPci+0x4d>
		s++, neg = 1;
f010ca97:	83 c2 01             	add    $0x1,%edx
f010ca9a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
f010caa1:	85 db                	test   %ebx,%ebx
f010caa3:	0f 94 c0             	sete   %al
f010caa6:	74 05                	je     f010caad <_Z6strtolPKcPPci+0x59>
f010caa8:	83 fb 10             	cmp    $0x10,%ebx
f010caab:	75 15                	jne    f010cac2 <_Z6strtolPKcPPci+0x6e>
f010caad:	80 3a 30             	cmpb   $0x30,(%edx)
f010cab0:	75 10                	jne    f010cac2 <_Z6strtolPKcPPci+0x6e>
f010cab2:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
f010cab6:	75 0a                	jne    f010cac2 <_Z6strtolPKcPPci+0x6e>
		s += 2, base = 16;
f010cab8:	83 c2 02             	add    $0x2,%edx
f010cabb:	bb 10 00 00 00       	mov    $0x10,%ebx
		s++;
	else if (*s == '-')
		s++, neg = 1;

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
f010cac0:	eb 13                	jmp    f010cad5 <_Z6strtolPKcPPci+0x81>
		s += 2, base = 16;
	else if (base == 0 && s[0] == '0')
f010cac2:	84 c0                	test   %al,%al
f010cac4:	74 0f                	je     f010cad5 <_Z6strtolPKcPPci+0x81>
f010cac6:	bb 0a 00 00 00       	mov    $0xa,%ebx
f010cacb:	80 3a 30             	cmpb   $0x30,(%edx)
f010cace:	75 05                	jne    f010cad5 <_Z6strtolPKcPPci+0x81>
		s++, base = 8;
f010cad0:	83 c2 01             	add    $0x1,%edx
f010cad3:	b3 08                	mov    $0x8,%bl
		s++, neg = 1;

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
		s += 2, base = 16;
	else if (base == 0 && s[0] == '0')
f010cad5:	b8 00 00 00 00       	mov    $0x0,%eax
f010cada:	89 de                	mov    %ebx,%esi

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
f010cadc:	0f b6 0a             	movzbl (%edx),%ecx
f010cadf:	89 cf                	mov    %ecx,%edi
f010cae1:	8d 59 d0             	lea    -0x30(%ecx),%ebx
f010cae4:	80 fb 09             	cmp    $0x9,%bl
f010cae7:	77 08                	ja     f010caf1 <_Z6strtolPKcPPci+0x9d>
			dig = *s - '0';
f010cae9:	0f be c9             	movsbl %cl,%ecx
f010caec:	83 e9 30             	sub    $0x30,%ecx
f010caef:	eb 1e                	jmp    f010cb0f <_Z6strtolPKcPPci+0xbb>
		else if (*s >= 'a' && *s <= 'z')
f010caf1:	8d 5f 9f             	lea    -0x61(%edi),%ebx
f010caf4:	80 fb 19             	cmp    $0x19,%bl
f010caf7:	77 08                	ja     f010cb01 <_Z6strtolPKcPPci+0xad>
			dig = *s - 'a' + 10;
f010caf9:	0f be c9             	movsbl %cl,%ecx
f010cafc:	83 e9 57             	sub    $0x57,%ecx
f010caff:	eb 0e                	jmp    f010cb0f <_Z6strtolPKcPPci+0xbb>
		else if (*s >= 'A' && *s <= 'Z')
f010cb01:	8d 5f bf             	lea    -0x41(%edi),%ebx
f010cb04:	80 fb 19             	cmp    $0x19,%bl
f010cb07:	77 15                	ja     f010cb1e <_Z6strtolPKcPPci+0xca>
			dig = *s - 'A' + 10;
f010cb09:	0f be c9             	movsbl %cl,%ecx
f010cb0c:	83 e9 37             	sub    $0x37,%ecx
		else
			break;
		if (dig >= base)
f010cb0f:	39 f1                	cmp    %esi,%ecx
f010cb11:	7d 0b                	jge    f010cb1e <_Z6strtolPKcPPci+0xca>
			break;
		s++, val = (val * base) + dig;
f010cb13:	83 c2 01             	add    $0x1,%edx
f010cb16:	0f af c6             	imul   %esi,%eax
f010cb19:	8d 04 01             	lea    (%ecx,%eax,1),%eax
		s++, base = 8;
	else if (base == 0)
		base = 10;

	// digits
	while (1) {
f010cb1c:	eb be                	jmp    f010cadc <_Z6strtolPKcPPci+0x88>
f010cb1e:	89 c1                	mov    %eax,%ecx
			break;
		s++, val = (val * base) + dig;
		// we don't properly detect overflow!
	}

	if (endptr)
f010cb20:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
f010cb24:	74 05                	je     f010cb2b <_Z6strtolPKcPPci+0xd7>
		*endptr = (char *) s;
f010cb26:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010cb29:	89 13                	mov    %edx,(%ebx)
	return (neg ? -val : val);
f010cb2b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
f010cb2f:	74 04                	je     f010cb35 <_Z6strtolPKcPPci+0xe1>
f010cb31:	89 c8                	mov    %ecx,%eax
f010cb33:	f7 d8                	neg    %eax
}
f010cb35:	83 c4 04             	add    $0x4,%esp
f010cb38:	5b                   	pop    %ebx
f010cb39:	5e                   	pop    %esi
f010cb3a:	5f                   	pop    %edi
f010cb3b:	5d                   	pop    %ebp
f010cb3c:	c3                   	ret    
f010cb3d:	00 00                	add    %al,(%eax)
	...

f010cb40 <__udivdi3>:
f010cb40:	55                   	push   %ebp
f010cb41:	89 e5                	mov    %esp,%ebp
f010cb43:	57                   	push   %edi
f010cb44:	56                   	push   %esi
f010cb45:	83 ec 10             	sub    $0x10,%esp
f010cb48:	8b 55 14             	mov    0x14(%ebp),%edx
f010cb4b:	8b 45 08             	mov    0x8(%ebp),%eax
f010cb4e:	8b 75 10             	mov    0x10(%ebp),%esi
f010cb51:	8b 7d 0c             	mov    0xc(%ebp),%edi
f010cb54:	85 d2                	test   %edx,%edx
f010cb56:	89 45 f0             	mov    %eax,-0x10(%ebp)
f010cb59:	75 35                	jne    f010cb90 <__udivdi3+0x50>
f010cb5b:	39 fe                	cmp    %edi,%esi
f010cb5d:	77 61                	ja     f010cbc0 <__udivdi3+0x80>
f010cb5f:	85 f6                	test   %esi,%esi
f010cb61:	0f 85 d9 00 00 00    	jne    f010cc40 <__udivdi3+0x100>
f010cb67:	31 d2                	xor    %edx,%edx
f010cb69:	b8 01 00 00 00       	mov    $0x1,%eax
f010cb6e:	f7 f6                	div    %esi
f010cb70:	89 f2                	mov    %esi,%edx
f010cb72:	8b 75 f0             	mov    -0x10(%ebp),%esi
f010cb75:	89 45 f4             	mov    %eax,-0xc(%ebp)
f010cb78:	89 f8                	mov    %edi,%eax
f010cb7a:	f7 75 f4             	divl   -0xc(%ebp)
f010cb7d:	89 c7                	mov    %eax,%edi
f010cb7f:	89 f0                	mov    %esi,%eax
f010cb81:	f7 75 f4             	divl   -0xc(%ebp)
f010cb84:	89 fa                	mov    %edi,%edx
f010cb86:	83 c4 10             	add    $0x10,%esp
f010cb89:	5e                   	pop    %esi
f010cb8a:	5f                   	pop    %edi
f010cb8b:	5d                   	pop    %ebp
f010cb8c:	c3                   	ret    
f010cb8d:	8d 76 00             	lea    0x0(%esi),%esi
f010cb90:	39 fa                	cmp    %edi,%edx
f010cb92:	77 1c                	ja     f010cbb0 <__udivdi3+0x70>
f010cb94:	0f bd c2             	bsr    %edx,%eax
f010cb97:	83 f0 1f             	xor    $0x1f,%eax
f010cb9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
f010cb9d:	75 31                	jne    f010cbd0 <__udivdi3+0x90>
f010cb9f:	39 75 f0             	cmp    %esi,-0x10(%ebp)
f010cba2:	0f 83 b0 00 00 00    	jae    f010cc58 <__udivdi3+0x118>
f010cba8:	39 d7                	cmp    %edx,%edi
f010cbaa:	0f 87 a8 00 00 00    	ja     f010cc58 <__udivdi3+0x118>
f010cbb0:	31 ff                	xor    %edi,%edi
f010cbb2:	31 c9                	xor    %ecx,%ecx
f010cbb4:	89 c8                	mov    %ecx,%eax
f010cbb6:	89 fa                	mov    %edi,%edx
f010cbb8:	83 c4 10             	add    $0x10,%esp
f010cbbb:	5e                   	pop    %esi
f010cbbc:	5f                   	pop    %edi
f010cbbd:	5d                   	pop    %ebp
f010cbbe:	c3                   	ret    
f010cbbf:	90                   	nop
f010cbc0:	89 fa                	mov    %edi,%edx
f010cbc2:	31 ff                	xor    %edi,%edi
f010cbc4:	f7 f6                	div    %esi
f010cbc6:	89 c1                	mov    %eax,%ecx
f010cbc8:	eb ea                	jmp    f010cbb4 <__udivdi3+0x74>
f010cbca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010cbd0:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010cbd4:	b8 20 00 00 00       	mov    $0x20,%eax
f010cbd9:	2b 45 f4             	sub    -0xc(%ebp),%eax
f010cbdc:	d3 e2                	shl    %cl,%edx
f010cbde:	89 c1                	mov    %eax,%ecx
f010cbe0:	89 55 ec             	mov    %edx,-0x14(%ebp)
f010cbe3:	89 f2                	mov    %esi,%edx
f010cbe5:	d3 ea                	shr    %cl,%edx
f010cbe7:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010cbeb:	0b 55 ec             	or     -0x14(%ebp),%edx
f010cbee:	d3 e6                	shl    %cl,%esi
f010cbf0:	89 c1                	mov    %eax,%ecx
f010cbf2:	89 75 e8             	mov    %esi,-0x18(%ebp)
f010cbf5:	89 fe                	mov    %edi,%esi
f010cbf7:	d3 ee                	shr    %cl,%esi
f010cbf9:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010cbfd:	89 55 ec             	mov    %edx,-0x14(%ebp)
f010cc00:	8b 55 f0             	mov    -0x10(%ebp),%edx
f010cc03:	d3 e7                	shl    %cl,%edi
f010cc05:	89 c1                	mov    %eax,%ecx
f010cc07:	d3 ea                	shr    %cl,%edx
f010cc09:	09 d7                	or     %edx,%edi
f010cc0b:	89 f2                	mov    %esi,%edx
f010cc0d:	89 f8                	mov    %edi,%eax
f010cc0f:	f7 75 ec             	divl   -0x14(%ebp)
f010cc12:	89 d6                	mov    %edx,%esi
f010cc14:	89 c7                	mov    %eax,%edi
f010cc16:	f7 65 e8             	mull   -0x18(%ebp)
f010cc19:	39 d6                	cmp    %edx,%esi
f010cc1b:	89 55 ec             	mov    %edx,-0x14(%ebp)
f010cc1e:	72 48                	jb     f010cc68 <__udivdi3+0x128>
f010cc20:	8b 55 f0             	mov    -0x10(%ebp),%edx
f010cc23:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010cc27:	d3 e2                	shl    %cl,%edx
f010cc29:	39 d0                	cmp    %edx,%eax
f010cc2b:	76 05                	jbe    f010cc32 <__udivdi3+0xf2>
f010cc2d:	39 75 ec             	cmp    %esi,-0x14(%ebp)
f010cc30:	74 36                	je     f010cc68 <__udivdi3+0x128>
f010cc32:	89 f9                	mov    %edi,%ecx
f010cc34:	31 ff                	xor    %edi,%edi
f010cc36:	e9 79 ff ff ff       	jmp    f010cbb4 <__udivdi3+0x74>
f010cc3b:	90                   	nop
f010cc3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cc40:	8b 4d f0             	mov    -0x10(%ebp),%ecx
f010cc43:	89 f8                	mov    %edi,%eax
f010cc45:	f7 f6                	div    %esi
f010cc47:	89 c7                	mov    %eax,%edi
f010cc49:	89 c8                	mov    %ecx,%eax
f010cc4b:	f7 f6                	div    %esi
f010cc4d:	89 c1                	mov    %eax,%ecx
f010cc4f:	e9 60 ff ff ff       	jmp    f010cbb4 <__udivdi3+0x74>
f010cc54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cc58:	31 ff                	xor    %edi,%edi
f010cc5a:	b9 01 00 00 00       	mov    $0x1,%ecx
f010cc5f:	e9 50 ff ff ff       	jmp    f010cbb4 <__udivdi3+0x74>
f010cc64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cc68:	8d 4f ff             	lea    -0x1(%edi),%ecx
f010cc6b:	31 ff                	xor    %edi,%edi
f010cc6d:	e9 42 ff ff ff       	jmp    f010cbb4 <__udivdi3+0x74>
	...

f010cc80 <__umoddi3>:
f010cc80:	55                   	push   %ebp
f010cc81:	89 e5                	mov    %esp,%ebp
f010cc83:	57                   	push   %edi
f010cc84:	56                   	push   %esi
f010cc85:	83 ec 20             	sub    $0x20,%esp
f010cc88:	8b 55 14             	mov    0x14(%ebp),%edx
f010cc8b:	8b 4d 08             	mov    0x8(%ebp),%ecx
f010cc8e:	8b 7d 10             	mov    0x10(%ebp),%edi
f010cc91:	8b 75 0c             	mov    0xc(%ebp),%esi
f010cc94:	85 d2                	test   %edx,%edx
f010cc96:	89 4d f0             	mov    %ecx,-0x10(%ebp)
f010cc99:	89 c8                	mov    %ecx,%eax
f010cc9b:	75 1b                	jne    f010ccb8 <__umoddi3+0x38>
f010cc9d:	39 f7                	cmp    %esi,%edi
f010cc9f:	76 47                	jbe    f010cce8 <__umoddi3+0x68>
f010cca1:	89 f2                	mov    %esi,%edx
f010cca3:	31 f6                	xor    %esi,%esi
f010cca5:	f7 f7                	div    %edi
f010cca7:	89 d0                	mov    %edx,%eax
f010cca9:	89 f2                	mov    %esi,%edx
f010ccab:	83 c4 20             	add    $0x20,%esp
f010ccae:	5e                   	pop    %esi
f010ccaf:	5f                   	pop    %edi
f010ccb0:	5d                   	pop    %ebp
f010ccb1:	c3                   	ret    
f010ccb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010ccb8:	39 f2                	cmp    %esi,%edx
f010ccba:	77 5c                	ja     f010cd18 <__umoddi3+0x98>
f010ccbc:	0f bd ca             	bsr    %edx,%ecx
f010ccbf:	83 f1 1f             	xor    $0x1f,%ecx
f010ccc2:	89 4d f4             	mov    %ecx,-0xc(%ebp)
f010ccc5:	75 61                	jne    f010cd28 <__umoddi3+0xa8>
f010ccc7:	39 f8                	cmp    %edi,%eax
f010ccc9:	0f 83 f9 00 00 00    	jae    f010cdc8 <__umoddi3+0x148>
f010cccf:	39 d6                	cmp    %edx,%esi
f010ccd1:	0f 87 f1 00 00 00    	ja     f010cdc8 <__umoddi3+0x148>
f010ccd7:	89 c2                	mov    %eax,%edx
f010ccd9:	89 d0                	mov    %edx,%eax
f010ccdb:	89 f2                	mov    %esi,%edx
f010ccdd:	83 c4 20             	add    $0x20,%esp
f010cce0:	5e                   	pop    %esi
f010cce1:	5f                   	pop    %edi
f010cce2:	5d                   	pop    %ebp
f010cce3:	c3                   	ret    
f010cce4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cce8:	85 ff                	test   %edi,%edi
f010ccea:	0f 85 c0 00 00 00    	jne    f010cdb0 <__umoddi3+0x130>
f010ccf0:	31 d2                	xor    %edx,%edx
f010ccf2:	b8 01 00 00 00       	mov    $0x1,%eax
f010ccf7:	f7 f7                	div    %edi
f010ccf9:	89 fa                	mov    %edi,%edx
f010ccfb:	89 c1                	mov    %eax,%ecx
f010ccfd:	89 f0                	mov    %esi,%eax
f010ccff:	31 f6                	xor    %esi,%esi
f010cd01:	f7 f1                	div    %ecx
f010cd03:	8b 45 f0             	mov    -0x10(%ebp),%eax
f010cd06:	f7 f1                	div    %ecx
f010cd08:	89 d0                	mov    %edx,%eax
f010cd0a:	89 f2                	mov    %esi,%edx
f010cd0c:	83 c4 20             	add    $0x20,%esp
f010cd0f:	5e                   	pop    %esi
f010cd10:	5f                   	pop    %edi
f010cd11:	5d                   	pop    %ebp
f010cd12:	c3                   	ret    
f010cd13:	90                   	nop
f010cd14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cd18:	89 ca                	mov    %ecx,%edx
f010cd1a:	89 d0                	mov    %edx,%eax
f010cd1c:	89 f2                	mov    %esi,%edx
f010cd1e:	83 c4 20             	add    $0x20,%esp
f010cd21:	5e                   	pop    %esi
f010cd22:	5f                   	pop    %edi
f010cd23:	5d                   	pop    %ebp
f010cd24:	c3                   	ret    
f010cd25:	8d 76 00             	lea    0x0(%esi),%esi
f010cd28:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010cd2c:	89 d0                	mov    %edx,%eax
f010cd2e:	ba 20 00 00 00       	mov    $0x20,%edx
f010cd33:	2b 55 f4             	sub    -0xc(%ebp),%edx
f010cd36:	d3 e0                	shl    %cl,%eax
f010cd38:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f010cd3b:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010cd3f:	89 fa                	mov    %edi,%edx
f010cd41:	d3 ea                	shr    %cl,%edx
f010cd43:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010cd47:	09 c2                	or     %eax,%edx
f010cd49:	8b 45 f0             	mov    -0x10(%ebp),%eax
f010cd4c:	89 55 e8             	mov    %edx,-0x18(%ebp)
f010cd4f:	89 f2                	mov    %esi,%edx
f010cd51:	d3 e7                	shl    %cl,%edi
f010cd53:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010cd57:	89 7d ec             	mov    %edi,-0x14(%ebp)
f010cd5a:	8b 7d f0             	mov    -0x10(%ebp),%edi
f010cd5d:	d3 ea                	shr    %cl,%edx
f010cd5f:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010cd63:	d3 e6                	shl    %cl,%esi
f010cd65:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010cd69:	d3 e8                	shr    %cl,%eax
f010cd6b:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010cd6f:	09 f0                	or     %esi,%eax
f010cd71:	f7 75 e8             	divl   -0x18(%ebp)
f010cd74:	d3 e7                	shl    %cl,%edi
f010cd76:	89 d1                	mov    %edx,%ecx
f010cd78:	f7 65 ec             	mull   -0x14(%ebp)
f010cd7b:	39 d1                	cmp    %edx,%ecx
f010cd7d:	72 61                	jb     f010cde0 <__umoddi3+0x160>
f010cd7f:	39 f8                	cmp    %edi,%eax
f010cd81:	77 55                	ja     f010cdd8 <__umoddi3+0x158>
f010cd83:	89 ce                	mov    %ecx,%esi
f010cd85:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010cd89:	29 c7                	sub    %eax,%edi
f010cd8b:	19 d6                	sbb    %edx,%esi
f010cd8d:	89 f2                	mov    %esi,%edx
f010cd8f:	d3 ef                	shr    %cl,%edi
f010cd91:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
f010cd95:	d3 e2                	shl    %cl,%edx
f010cd97:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
f010cd9b:	09 fa                	or     %edi,%edx
f010cd9d:	d3 ee                	shr    %cl,%esi
f010cd9f:	89 d0                	mov    %edx,%eax
f010cda1:	89 f2                	mov    %esi,%edx
f010cda3:	83 c4 20             	add    $0x20,%esp
f010cda6:	5e                   	pop    %esi
f010cda7:	5f                   	pop    %edi
f010cda8:	5d                   	pop    %ebp
f010cda9:	c3                   	ret    
f010cdaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f010cdb0:	89 f0                	mov    %esi,%eax
f010cdb2:	31 f6                	xor    %esi,%esi
f010cdb4:	f7 f7                	div    %edi
f010cdb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
f010cdb9:	f7 f7                	div    %edi
f010cdbb:	89 d0                	mov    %edx,%eax
f010cdbd:	89 f2                	mov    %esi,%edx
f010cdbf:	83 c4 20             	add    $0x20,%esp
f010cdc2:	5e                   	pop    %esi
f010cdc3:	5f                   	pop    %edi
f010cdc4:	5d                   	pop    %ebp
f010cdc5:	c3                   	ret    
f010cdc6:	66 90                	xchg   %ax,%ax
f010cdc8:	29 f8                	sub    %edi,%eax
f010cdca:	19 d6                	sbb    %edx,%esi
f010cdcc:	89 c2                	mov    %eax,%edx
f010cdce:	e9 06 ff ff ff       	jmp    f010ccd9 <__umoddi3+0x59>
f010cdd3:	90                   	nop
f010cdd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cdd8:	39 ca                	cmp    %ecx,%edx
f010cdda:	75 a7                	jne    f010cd83 <__umoddi3+0x103>
f010cddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
f010cde0:	2b 45 ec             	sub    -0x14(%ebp),%eax
f010cde3:	1b 55 e8             	sbb    -0x18(%ebp),%edx
f010cde6:	eb 9b                	jmp    f010cd83 <__umoddi3+0x103>
