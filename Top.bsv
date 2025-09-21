import Uart::*;
import UartSender::*;
import GetPut::*;
import StmtFSM::*;
import Connectable::*;

(* synthesize *)
module mkUartTx1(UartTx#(115200, 50_000_000));
	UartTx#(115200, 50_000_000) u<-mkUartTx;
	return u;
endmodule

(* synthesize *)
module mkUartRx1(UartRx#(115200, 50_000_000));
	UartRx#(115200, 50_000_000) u<-mkUartRx;
	return u;
endmodule


(* synthesize *)
module mkTop(Empty);
    UartRx#(115200,50000000) rx<-mkUartRx1;
    UartTx#(115200,50000000) tx<-mkUartTx1;
    mkConnection(tx.wires, rx.wires);

    mkAutoFSM(
        seq
            repeat(200) noAction;
            tx.tx.put('haa);
            //repeat(1) noAction;
            $display(rx.rx.get);            

            tx.tx.put('h55);
            //repeat(1) noAction;
            $display(rx.rx.get);            
        endseq
    );
    
endmodule
