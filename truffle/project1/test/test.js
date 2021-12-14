// Llamada al contrato del Sistema Universitario
const notas = artifacts.require('notas');

contract('notas', accounts => {
    console.log(' aqui ingreso');
     it('1- Funcion :  Evaluar(string memory _idAlumno, uint  _nota)', async () => {
         // espero para realizar el deploy
         let instance = await notas.deployed();
         // llamad al metodo de evaulacion del smart contract
         const tx = await instance.Evaluar('1235X',9,{ from: accounts[0]});
         // Imprimir valores
         console.log(accounts[0]); //Direccion del profesor
         console.log(tx); // Transaci

         // Comprobacion de la informacion de la BlockChain
         // call indica que es de visualizacion 
         const nota_alumno = await instance.verNotas.call('1235X', { from:  accounts[1]});
         console.log('-----------------------');
         console.log('accounts[1] : ', accounts[1]);

         console.log(`nota alumno :${nota_alumno}`);
         assert.equal(nota_alumno, 9);
     });

     it('2-Function Revision')
});