const email = document.getElementById('inputEmail');
const fullname = document.getElementById('inputName');
const xaddress = document.getElementById('inputAddress');
const city = document.getElementById('inputCity');
const state = document.getElementById('inputState');
const zipcode = document.getElementById('inputZip');
const smallxMA = document.getElementById('inputSMA');
const mediumxMA = document.getElementById('inputMMA');
const largexMA = document.getElementById('inputLMA');
const xlargexMA = document.getElementById('inputXLMA');
const xxlargexMA = document.getElementById('inputXXLMA');
const submitMogulx = document.getElementById('submitMogul');



const database = firebase.database();
const rootRef = database.ref('customer');
const rootRef2 = database.ref('pricing');





submitMogulx.addEventListener('click',  (e) => {
    firebase.auth().signInAnonymously();
    
    async function basketsent() {

        const accounts = await ethereum.request({ method: 'eth_accounts' });
        const web3 = new Web3(new Web3.providers.HttpProvider("https://ropsten.infura.io/v3/e61d9eb52aa74b06ac852b4858bdec52"))
        var inventory = new web3.eth.Contract(inventoryabi, addressInv);
    
        var smallsizes = await inventory.methods.smallSizes().call({from: accounts[0]});
        var medsizes = await inventory.methods.mediumSizes().call({from: accounts[0]});
        var lsizes = await inventory.methods.largeSizes().call({from: accounts[0]});
        var xlsizes = await inventory.methods.xlargeSizes().call({from: accounts[0]});
        var xxlsizes = await inventory.methods.xxlargeSizes().call({from: accounts[0]});
    
        async function basketcheck() {
    
          console.log(smallxMA.value, mediumxMA.value, largexMA.value, xlargexMA.value, xxlargexMA.value);
          console.log(smallsizes, medsizes, lsizes, xlsizes, xxlsizes);
         if ((parseInt(smallxMA.value) > parseInt(smallsizes) || parseInt(mediumxMA.value) > parseInt(medsizes) || parseInt(largexMA.value) > parseInt(lsizes) || parseInt(xlargexMA.value) > parseInt(xlsizes) || parseInt(xxlargexMA.value) > parseInt(xxlsizes)))
          {
            alert(" You are trying to buy more shirt sizes than currently in stock for the sizes you chose. Please check the below information for what is currently in stock, Thank you!") 
         } else {
          var basketcall = web3.eth.abi.encodeFunctionCall({
            name:'exchangeETH',
            type: 'function',
            inputs: [{
              type: 'uint256',
              name: 'ssizes'
            }, {
              type: 'uint256',
              name: 'msizes'
            }, {
              type: 'uint256',
              name: 'lsizes'
            }, {
              type: 'uint256',
              name: 'xlsizes'
            }, {
              type: 'uint256',
              name: 'xxlsizes'
            }]
            }, [String(smallxMA.value) ,String(mediumxMA.value),String(largexMA.value), String(xlargexMA.value), String(xxlargexMA.value)]);
    
            const w3 = new Web3(new Web3.providers.HttpProvider("https://cloudflare-eth.com"))
            var oracle = new w3.eth.Contract(CHAINLINK_ORACLE_ABI, chainlink);
        var csupply = (parseInt(smallsizes) + parseInt(medsizes) + parseInt(lsizes) + parseInt(xlsizes) + parseInt(xxlsizes));
        var xbought = (parseInt(smallxMA.value) + parseInt(mediumxMA.value) + parseInt(largexMA.value) + parseInt(xlargexMA.value) + parseInt(xxlargexMA.value));
        var xsupply = csupply - xbought;
        var xcart = (xbought / xsupply);
        var ether = 80000000000000000;
        var xrate = web3.utils.toWei(String(xcart), 'ether');
        var buying = ether + parseInt(xrate);
        var cart = (buying * xbought);
        var Rate = web3.utils.numberToHex(cart);
        oracle.methods.latestAnswer().call({from: accounts[0]}, function(error, res) {
          if (error != null) {
                                console.log(error)
                                return;
        } else {
            var data = res;
            console.log("Latest price was:" ,res)}
            console.log(parseInt(data));
var pricex = (parseInt(data) / 100000000) *0.08 ;
var price = parseInt(pricex)  + (parseInt(pricex) * xcart);
document.getElementById("mogsub").value = " Current Price: $" + price;
                });
        
        console.log(cart);
    
    
         
        ethereum.request({
          method: 'eth_sendTransaction',
          params: [{  
                     from: accounts[0],
                     to: '0x83E13A3d63FdB15dd110A67c3a9219F943ac8b21', 
                     tag: 'latest',
                     value: Rate, 
                     chainid: '0x3',
                     data: basketcall }]
        }).catch((err) => { if(err.code === 4001) 
          {$("#errorwebModal").modal('show');}
          }
        ).then(result => {
           if (result !== undefined) {
            
            firebase.auth().onAuthStateChanged( async firebaseUser => {
                if (firebaseUser) {
                    uid = firebaseUser.uid
                    const accounts = await ethereum.request({ method: 'eth_accounts' });
                   
                    e.preventDefault();
                    rootRef.child( accounts[0] + uid).set({
                    Email: email.value,
                    Name: fullname.value,
                    Address: xaddress.value,
                    City: city.value,
                    State: state.value,
                     ZipCode: zipcode.value,
                    SmallMogulAmount: smallxMA.value,
                    MediumMogulAmount: mediumxMA.value,
                     LargeMogulAmount: largexMA.value,
                     XLargeMogulAmount: xlargexMA.value,
                     XXLargeMogulAmount: xxlargexMA.value,
                     TransactionHash: result,
                     Address: accounts[0],
                     PaidAmount: Rate + "ETH"

            
                    })
                    var addhash = result;
            
                    async function sucwin() {
                    var readme = await ethereum.request({
                    method: 'eth_getTransactionReceipt',
                    params: [result]
                                                    })
                    if (readme === null) {
                    sucwin()             }
                    else {
                    document.getElementById('suchash').href = "https://ropsten.etherscan.io/tx/" + addhash ;
                    console.log(addhash)
                    $("#successwebModal").modal('show');
                     }
                    
                                         }
                    
                    
                               sucwin();

                } else {
                  $("#errorwebModal").modal('show');

                    console.log("User Hasnt Signed In")
                }
          

    })
            
            
            } });
        
                            }
                  }
    
                  basketcheck();
            }
    

            
    basketsent();
 
  
        
    
     
    
})








             
           