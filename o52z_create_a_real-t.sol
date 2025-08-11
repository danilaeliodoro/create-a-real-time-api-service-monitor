pragma solidity ^0.8.0;

contract RealTimeAPIServiceMonitor {
    // Mapping of API endpoints to their current status
    mapping (string => bool) public apiEndpoints;

    // Mapping of API endpoints to their last ping timestamp
    mapping (string => uint) public lastPing;

    // Event emitted when an API endpoint changes status
    event APIStatusChanged(string endpoint, bool status);

    // Function to add a new API endpoint to the monitor
    function addAPIEndpoint(string calldata endpoint) public {
        apiEndpoints[endpoint] = true;
        lastPing[endpoint] = block.timestamp;
    }

    // Function to update the status of an API endpoint
    function updateAPIStatus(string calldata endpoint, bool status) public {
        apiEndpoints[endpoint] = status;
        lastPing[endpoint] = block.timestamp;
        emit APIStatusChanged(endpoint, status);
    }

    // Function to get the current status of an API endpoint
    function getAPIStatus(string calldata endpoint) public view returns (bool) {
        return apiEndpoints[endpoint];
    }

    // Function to ping an API endpoint and update its status
    function pingAPIEndpoint(string calldata endpoint) public {
        // Make an external call to the API endpoint using Web3.js or other libraries
        // If the call is successful, update the status to true
        // If the call fails, update the status to false
        // For simplicity, assume the API endpoint returns a 200 status code on success
        bool status = /* make external call to API endpoint */;
        updateAPIStatus(endpoint, status);
    }
}