import './App.css';
import mintExampleAbi from "./mintExampleAbi.json";
import { ethers, BigNumber} from "ethers";
import { useEffect, useState} from "react";
const mintExampleAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";

function App() {
  //cONNECTION 
  const [accounts, setAccounts] = useState([]);

  async function connectAccounts(){
     if( window.ethereum) {
        const accounts = await window.ethereum.request({
            method: "eth_requestAccounts"  
        });
        setAccounts(accounts);
     }
  }

   useEffect(() => {
      connectAccounts(); 
   }, [])

   // MINTING 
   const[mintAmount, setMintAmount] = useState(1);

   async function handleMint(){
         if( window.ethereum) {
           const provider = new ethers.provider.Web3Provider(window.ethereum);
           const signer = provider.getSigner();
           
           const contract = new ethers.Contract(
             mintExampleAddress,
             mintExampleAbi.abi,
             signer
           );
           try {
               //llamamos a la function mint del contract
               const response = await contract.mint(BigNumber.from(mintAmount));
               console.log(response);
           }catch(error){
                console.error(error);
           } 
         }
   }

  return (
    <div className="App">
       { accounts.length && (
       <div>
       <button onClick={() => setMintAmount( mintAmount -1)}>-1</button>
       {mintAmount}
       <button onClick={() => setMintAmount( mintAmount + 1)}>+1</button>
       <button onClick={handleMint}>+1</button>
      
       </div>
       )}
    </div>
  );
}

export default App;
