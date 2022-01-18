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
         const nota_alumno2 = await instance.verNotas.call('12356X', { from:  accounts[1]});
         console.log('-----------------------');
         console.log('accounts[1] : ', accounts[1]);

         console.log(`nota alumno :${nota_alumno}`);
         assert.equal(nota_alumno, 9);
     });

     it('2-Function Revision', async() =>{
         //Smart contract desplegado 
         let instance = await notas.deployed();
         // llamada la metodo de revisar examenes 
         const rev = await instance.Revision('1235X',{from: accounts[1]});
         const rev1 = await instance.Revision('12356X',{from: accounts[1]});

         // Imprimir valores recibidos de la revision 
         console.log(rev);
         // Verificion para el alumno adecuado
         const id_alumno =  await instance.VerRevisiones.call({from: accounts[0]});
         console.log(id_alumno);
         assert.equal(id_alumno,'1235X')

     })
});