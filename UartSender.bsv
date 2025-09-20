import Uart::*;
import StmtFSM::*;
import GetPut::*;
typedef 115200 BaudRate;
typedef 10_000_000 ClockFreq;

(*synthesize*)
module mkUartSender(UartTxWires#(BaudRate, ClockFreq));
    UartTx#(BaudRate, ClockFreq) tx <- mkUartTx;
    mkAutoFSM(
        seq
            while (True)seq
                tx.tx.put(fromInteger(charToInteger("a")));
                tx.tx.put(fromInteger(charToInteger("b")));
                tx.tx.put(fromInteger(charToInteger("c")));
                tx.tx.put(13);
                tx.tx.put(10);
            endseq
        endseq
    );
    return tx.wires;
endmodule
