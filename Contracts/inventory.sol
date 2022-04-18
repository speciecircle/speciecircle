pragma solidity >=0.5.0 <0.8.0;

import "./Context.sol";
import "./IERC20.sol";
import "./SafeMath.sol";

import "./IERC721.sol";
import "./IERC721Metadata.sol";
import "./IERC721Enumerable.sol";
import "./IERC721Receiver.sol";
import "./ERC165.sol";
import "./SafeMath.sol";
import "./Address.sol";
import "./EnumerableSet.sol";
import "./EnumerableMap.sol";
import "./Strings.sol";

/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */

/** Set a mapping for list of contracts that can interact with this contract, for use of its functions 8/12/2021 1:00PM*/


contract Inventory {
    
    using SafeMath for uint;
    address payable owner;
    event addingSmallSizeMogulInventory(uint amount);
    event addingMediumSizeMogulInventory(uint amount);
    event addingLargeSizeMogulInventory(uint amount);
    event addingxLargeSizeMogulInventory(uint amount);
    event addingxxLargeSizeMogulInventory(uint amount);
    event addingSmallSizeFilmInventory(uint amount);
    event addingMediumSizeFilmInventory(uint amount);
    event addingLargeSizeFilmInventory(uint amount);
    event addingxLargeSizeFilmInventory(uint amount);
    event addingxxLargeSizeFilmInventory(uint amount);
    event shippingstatusMogulchange(bool status);
    event shippingstatusFilmchange(bool status);
    event boughtsmallsizeMogulamount(address _address, uint amount, uint orderNum);
    event boughtmediumsizeMogulamount(address _address, uint amount, uint orderNum);
    event boughtlargesizeMogulamount(address _address, uint amount, uint orderNum);
    event boughtxlargesizeMogulamount(address _address, uint amount, uint orderNum);
    event boughtxxlargesizeMogulamount(address _address, uint amount, uint orderNum);
    event boughtsmallsizeFilmamount(address _address, uint amount, uint orderNum);
    event boughtmediumsizeFilmamount(address _address, uint amount, uint orderNum);
    event boughtlargesizeFilmamount(address _address, uint amount, uint orderNum);
    event boughtxlargesizeFilmamount(address _address, uint amount, uint orderNum);
    event boughtxxlargesizeFilmamount(address _address, uint amount, uint orderNum);
    event TokenSentWithClothingBuyOrder(address _address, uint amount);
    event bought (uint256 TotalBasketAmount);
    event sizesbought (uint256 xbought);
    event Ratechange (uint256 Rate);
    event percentChange(uint256 percentup);
    event currentsupply(uint256 cccbought);
    event claimmogul(uint claim);
    event claimfilm(uint claim);
    
    struct OrderInfo {
    uint OrderNum;
    bool FilmShipped;
    bool MogulShipped;
    uint smallMogul_sizes;
    uint mediumMogul_sizes;
    uint largeMogul_sizes;
    uint xlargeMogul_sizes;
    uint xxlargeMogul_sizes;
    uint smallFilm_sizes;
    uint mediumFilm_sizes;
    uint largeFilm_sizes;
    uint xlargeFilm_sizes;
    uint xxlargeFilm_sizes;
    uint CanClaimMogulAmount;
    uint CanClaimFilmAmount;
    uint CanClaimMogul;
    uint CanClaimFilm;
    }

  

    struct sizes {
        uint amount;
    }
    
  
    
   

   mapping(address => OrderInfo)  order_info;
   
     
    
    
     
    
    
    sizes public smallMogulSizes;
    sizes public mediumMogulSizes;
    sizes public largeMogulSizes;
    sizes public xlargeMogulSizes;
    sizes public xxlargeMogulSizes;
    sizes public smallFilmSizes;
    sizes public mediumFilmSizes;
    sizes public largeFilmSizes;
    sizes public xlargeFilmSizes;
    sizes public xxlargeFilmSizes;
   
    
    
    
    constructor() public {
        owner = msg.sender;
      
        smallMogulSizes.amount = 20;
        mediumMogulSizes.amount = 20 ;
        largeMogulSizes.amount = 20;
        xlargeMogulSizes.amount = 20;
        xxlargeMogulSizes.amount = 20;
        smallFilmSizes.amount = 20;
        mediumFilmSizes.amount = 20 ;
        largeFilmSizes.amount = 20;
        xlargeFilmSizes.amount = 20;
        xxlargeFilmSizes.amount = 20;
       
        
       
       
        
       
        
    }
    
    function addSmallMogulSizeInventory(uint _amount) public{
        
        
        require(msg.sender == owner, "this function is restricted to the owner");
        sizes storage smallSizes_ = smallMogulSizes;
        smallSizes_.amount += _amount; 
        emit addingSmallSizeMogulInventory(_amount);
        
    }
    
    
    function addMediumMogulSizeInventory(uint _amount) public {
        
        require(msg.sender == owner, "this function is restricted to the owner");
        sizes storage mediumSizes_ = mediumMogulSizes;
        mediumSizes_.amount += _amount;
        emit addingMediumSizeMogulInventory(_amount);
        
    }

function addLargeMogulSizeInventory(uint _amount) public {
        require(msg.sender == owner, "this function is restricted to the owner");
        sizes storage largeSizes_ = largeMogulSizes;
        largeSizes_.amount += _amount;
        emit addingLargeSizeMogulInventory(_amount);
    }
    
function addxLargeMogulSizeInventory(uint _amount) public {
        require(msg.sender == owner, "this function is restricted to the owner");
        sizes storage xlargeSizes_ = xlargeMogulSizes;
        xlargeSizes_.amount += _amount;
        emit addingxLargeSizeMogulInventory(_amount);
    }

function addxxLargeMogulSizeInventory(uint _amount) public {
        require(msg.sender == owner, "this function is restricted to the owner");
        sizes storage xxlargeSizes_ = xxlargeMogulSizes;
        xxlargeSizes_.amount += _amount;
        emit addingLargeSizeMogulInventory(_amount);
    }
    
   function addSmallFilmSizeInventory(uint _amount) public{
        
        
        require(msg.sender == owner, "this function is restricted to the owner");
        sizes storage smallSizes_ = smallFilmSizes;
        smallSizes_.amount += _amount; 
        emit addingSmallSizeFilmInventory(_amount);
        
    }
    
     function addMediumFilmSizeInventory(uint _amount) public {
        
        require(msg.sender == owner, "this function is restricted to the owner");
        sizes storage mediumSizes_ = mediumFilmSizes;
        mediumSizes_.amount += _amount;
        emit addingMediumSizeFilmInventory(_amount);
        
    }
    
    function addLargeFillmSizeInventory(uint _amount) public {
        require(msg.sender == owner, "this function is restricted to the owner");
        sizes storage largeSizes_ = largeFilmSizes;
        largeSizes_.amount += _amount;
        emit addingLargeSizeFilmInventory(_amount);
    }
    
function addxLargeFilmSizeInventory(uint _amount) public {
        require(msg.sender == owner, "this function is restricted to the owner");
        sizes storage xlargeSizes_ = xlargeFilmSizes;
        xlargeSizes_.amount += _amount;
        emit addingxLargeSizeFilmInventory(_amount);
    }

function addxxLargeFilmSizeInventory(uint _amount) public {
        require(msg.sender == owner, "this function is restricted to the owner");
        sizes storage xxlargeSizes_ = xxlargeFilmSizes;
        xxlargeSizes_.amount += _amount;
        emit addingLargeSizeFilmInventory(_amount);
    }
    
   function basketMogul( address _address, uint256 _small_sizes, uint256 _medium_sizes, uint256 _large_sizes, uint256 _xlarge_sizes, uint256 _xxlarge_sizes) internal {
        
       
       sizes storage sMSizes = smallMogulSizes;
       sizes storage mMSizes = mediumMogulSizes;
       sizes storage lMSizes = largeMogulSizes;
       sizes storage xlMSizes = xlargeMogulSizes;
       sizes storage xxlMSizes = xxlargeMogulSizes;
       
       
        
        
        OrderInfo storage buyer = order_info[_address];
        
         
       
        
        
        /** approve(_address, _small_sizes); */
        
        
             
        if (sMSizes.amount < _small_sizes){
            revert("Amount is Greater Than Supply");
            
        } else {
        sMSizes.amount -= _small_sizes; 
        }
        buyer.smallMogul_sizes += _small_sizes;
        
        
        emit boughtsmallsizeMogulamount(_address, _small_sizes, block.number);
        
        
        
        /**medium sizes*/
        
        if (mMSizes.amount < _medium_sizes){
            revert("Amount is Greator Than Supply");
        } else {
        mMSizes.amount -= _medium_sizes;
        }
        buyer.mediumMogul_sizes += _medium_sizes;
        
        
        emit boughtmediumsizeMogulamount(_address, _medium_sizes, block.number);
        
        
        /**large sizes*/
        
        if (lMSizes.amount < _large_sizes){
            revert("Amount is Greater Than Supply");
        } else {
        lMSizes.amount -= _large_sizes;
        }
        buyer.largeMogul_sizes += _large_sizes;
       
       
        emit boughtlargesizeMogulamount(_address, _large_sizes, block.number);
        
        
        
        /**Xlarge sizes*/
        
          if (xlMSizes.amount < _xlarge_sizes){
            revert("Amount is Greater Than Supply");
            
        } else {
        xlMSizes.amount -= _xlarge_sizes;
        }
        buyer.xlargeMogul_sizes += _xlarge_sizes;
        
        
        emit boughtxlargesizeMogulamount(_address, _xlarge_sizes, block.number);
        
        
        
        /**XXLarge sizes*/
        
        
          if (xxlMSizes.amount < _xxlarge_sizes){
            revert("Amount is Greater Than Supply");
            
        } else {
        xxlMSizes.amount -= _xxlarge_sizes;
        }
        buyer.xxlargeMogul_sizes += _xxlarge_sizes;
       
       
        emit boughtxxlargesizeMogulamount(_address, _xxlarge_sizes, block.number);
        
        buyer.OrderNum = block.number;
        buyer.CanClaimMogulAmount += (buyer.smallMogul_sizes + buyer.mediumMogul_sizes + buyer.largeMogul_sizes + buyer.xlargeMogul_sizes + buyer.xxlargeMogul_sizes);
        buyer.CanClaimMogul += 1;
        emit claimmogul(buyer.CanClaimMogul);
        
        
}

function basketFilm( address _address, uint256 _small_sizes, uint256 _medium_sizes, uint256 _large_sizes, uint256 _xlarge_sizes, uint256 _xxlarge_sizes) internal {
        
       
       sizes storage sFSizes = smallFilmSizes;
       sizes storage mFSizes = mediumFilmSizes;
       sizes storage lFSizes = largeFilmSizes;
       sizes storage xlFSizes = xlargeFilmSizes;
       sizes storage xxlFSizes = xxlargeFilmSizes;
       
       
        
        
        OrderInfo storage buyer = order_info[_address];
        
         
       
        
        
        /** approve(_address, _small_sizes); */
        
        
             
        if (sFSizes.amount < _small_sizes){
            revert("Amount is Greater Than Supply");
            
        } else {
        sFSizes.amount -= _small_sizes; 
        }
        buyer.smallFilm_sizes += _small_sizes;
        
        
        emit boughtsmallsizeFilmamount(_address, _small_sizes, block.number);
        
        
        
        /**medium sizes*/
        
        if (mFSizes.amount < _medium_sizes){
            revert("Amount is Greator Than Supply");
        } else {
        mFSizes.amount -= _medium_sizes;
        }
        buyer.mediumFilm_sizes += _medium_sizes;
        
       
        emit boughtmediumsizeFilmamount(_address, _medium_sizes, block.number);
        
        
        /**large sizes*/
        
        if (lFSizes.amount < _large_sizes){
            revert("Amount is Greater Than Supply");
        } else {
        lFSizes.amount -= _large_sizes;
        }
        buyer.largeFilm_sizes += _large_sizes;
        
        
        emit boughtlargesizeFilmamount(_address, _large_sizes, block.number);
        
        
        
        /**Xlarge sizes*/
        
          if (xlFSizes.amount < _xlarge_sizes){
            revert("Amount is Greater Than Supply");
            
        } else {
        xlFSizes.amount -= _xlarge_sizes;
        }
        buyer.xlargeFilm_sizes += _xlarge_sizes;
        
        
        emit boughtxlargesizeFilmamount(_address, _xlarge_sizes, block.number);
        
        
        
        /**XXLarge sizes*/
        
        
          if (xxlFSizes.amount < _xxlarge_sizes){
            revert("Amount is Greater Than Supply");
            
        } else {
        xxlFSizes.amount -= _xxlarge_sizes;
        }
        buyer.xxlargeFilm_sizes += _xxlarge_sizes;
        
        
        emit boughtxxlargesizeFilmamount(_address, _xxlarge_sizes, block.number);
        
        buyer.OrderNum = block.number;
        buyer.CanClaimFilm += 1;
        buyer.CanClaimFilmAmount += (buyer.smallFilm_sizes + buyer.mediumFilm_sizes + buyer.largeFilm_sizes + buyer.xlargeFilm_sizes + buyer.xxlargeFilm_sizes);
        emit claimfilm(buyer.CanClaimFilm);
        
        
}



    
}





