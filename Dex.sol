pragma abicoder v2;

contract Dex {
    struct Token {
        bytes32 ticker;
        address tokenAddress;
    }

    mapping(bytes32 => Token) public tokens;
    bytes32[] public tokenList;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function addToken(bytes32 ticker, address tokenAddress) onlyAdmin() external {
        tokens[ticker] = Token(ticker, tokenAddress);
        tokenList.push(ticker);
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, 'only admin');
        _;
    }
}