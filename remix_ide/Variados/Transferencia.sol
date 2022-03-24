//SPDX-License-Identifier: GLP-3.0

pragma solidity > 0.7.9 <0.9.0;

contract Trasnferencia {
   

    // le podemos enviar saldos al ether desde su creacion
    constructor() payable {
     
    }

   // payable : indica que la cuenta es de pago 
   // obtenemos una respuesta
   function transferenciaPorSend(address destino , uint monto) public returns(bool) {
      bool salida = payable(destino).send(monto);
      return salida;
   }


    // Por transfer no tenemos una respuesta   
    function transferenciaPorTransfer(address destino , uint monto) public  {
      payable(destino).transfer(monto);
   }


    // valor de retorno con varias salidas 
    function transferenciaPorCall(address destino , uint monto) public returns (bool) {
      (bool salida, bytes memory respuesta) =  destino.call{ value : monto}("");
      return salida;
   }




}
