module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*", // uses network id when its deplpyed to the ABI e.g. Robsten network would be '3'
    }
  }
};
