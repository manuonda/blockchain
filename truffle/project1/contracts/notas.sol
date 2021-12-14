// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// --------------------------
//ALUMON | ID      | Nota
//Marcos | 3123123 | 5
//Juan   | 3242345 | 4


contract notas{

    //Direccion del profesor
    address public profesor;
    string my_string="Joan";

    //Mapping para relacionar el hash de la indentidad del alumno con su nota del examen
    mapping(bytes32 => uint) public notas;
    
    //Array de los alumnos que pidan revision de examen
    string[] revisiones;
    
    //eventos alumon evaluado
    event alumno_evaluado(bytes32);
    event evento_revision(string);

    modifier onlyOnwer() {
        require(msg.sender == profesor,"Only onwer");
        _;
    }

    constructor() {
        profesor = msg.sender;
    }

    function Evaluar(string memory _idAlumno, uint  _nota) external onlyOnwer {
       // Hash de la identificacion del alumno
       bytes32 hash_idAlumno = keccak256(abi.encode(_idAlumno));

       //Relacion entre el hash de la identificacion del alumno y su nota
       notas[hash_idAlumno] = _nota;
       emit alumno_evaluado(hash_idAlumno);
    }

    function verNotas(string memory _idAlumno) external  view returns(uint) {
        bytes32 hash_idAlumno = keccak256(abi.encode(_idAlumno));
        return notas[hash_idAlumno];
    }

    // Function para pedir una revision del examen
    function Revision(string memory _idAlumno) public {
      //Almacenamiento de la identidad del alumno en un array 
      revisiones.push(_idAlumno);
      // Emision del evento 
      emit evento_revision(_idAlumno);
    }

    //Function para ver los alumnos que han solicitado revision de examen 
    function VerRevisiones() public view onlyOnwer returns (string[] memory){
       return revisiones;
    }


}