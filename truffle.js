var HDWalletProvider = require('@truffle/hdwallet-provider');

// Network configuration factory
const getInfuraConfig = (networkName, networkId) => {
    var keys = {};

    try {
        keys = require('./keys.json');
    } catch (err) {
        console.log('could not find ./keys.json');
    }

    return {
        network_id: networkId, // eslint-disable-line camelcase
        provider: () => {
            return new HDWalletProvider(
                keys.keys,
                `https://${networkName}.infura.io/v3/` + keys.infura_projectid,
                0,
                10
            );
        },
        gas: 7900000,
        gasPrice: 100000000000
    };
};

module.exports = {
    plugins: [
        'solidity-coverage'
    ],

    networks: {
        development: {
            host: 'localhost',
            port: 8545,
            network_id: '*', // eslint-disable-line camelcase
            gas: 8000000,
            gasPrice: 20000000000
        },
        main: getInfuraConfig('mainnet', 1),
        ropsten: getInfuraConfig('ropsten', 3)
    },

    compilers: {
        solc: {
            version: '0.6.2',
            settings: {
                optimizer: {
                    enabled: true,
                    runs: 200
                }
            }
        }
    }
};
