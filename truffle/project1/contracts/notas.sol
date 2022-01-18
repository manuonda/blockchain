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
    mapping(bytes32 => uint) public Notas;
    

    mapping(string => string[]) revisiones;
    
    //eventos alumon evaluado
    event alumno_evaluado(bytes32);
    event evento_revision(string);

    modifier onlyOnwer() {
        require(msg.sender == profesor,"Only onwer");
        _;
    }

    modifier unicamenteProfesor(address _direccion) {
        require(_direccion == profesor, "No tiene permisos para ejecutar esta funcion");
        _;
    }


    constructor() {
        profesor = msg.sender;
    }

    function Evaluar(string memory _asignatura,  string memory _idAlumno, uint  _nota) public unicamenteProfesor(msg.sender) {
       // Hash de la identificacion del alumno
       bytes32 hash_idAlumno = keccak256(abi.encode(_asignatura, _idAlumno));

       //Relacion entre el hash de la identificacion del alumno y su nota
       Notas[hash_idAlumno] = _nota;
       emit alumno_evaluado(hash_idAlumno);
    }

    function verNotas(string memory _asignatura, string memory _idAlumno) external  view returns(uint) {
        bytes32 hash_idAlumno = keccak256(abi.encode(_asignatura, _idAlumno));
        return Notas[hash_idAlumno];
    }

    // Function para pedir una revision del examen
    function Revision(string memory _asignatura, string memory _idAlumno) public {
      //Almacenamiento de la identidad del alumno en un array 
      revisiones[_asignatura].push(_idAlumno);
      //revisiones.push(_idAlumno);
      // Emision del evento 
      emit evento_revision(_idAlumno);
    }

    //Function para ver los alumnos que han solicitado revision de examen 
    function VerRevisiones(string memory _asignatura) public view onlyOnwer returns (string[] memory){
       return revisiones[_asignatura];
    }


}