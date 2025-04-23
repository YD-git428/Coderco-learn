# Networking

#### A Group of Devices that share resources and information

## LAN & WAN

**Local Area Network** - Network which covers a limited Area

**Wide Area Network** - A Group of LANs that connect to eachother e.g. When using the internet, the device sends data over to the server via network, then the server processes data & gives back a response.

### Key Network components

**Switches** - connects devices within the same network = Manages how data travels within a LAN, which means more efficient communication and less congestion as apposed to WANs

**Router** - Directs traffic between networks e.g. Your Device and the Wifi box

**Firewall** - Security Guard for a Network Monitors ingress and egress network traffic based on predefined roles

### IP Addressing

#### Its a unique identifier assigned to each device to ensure transcommunication
**IPv4 & IPv6** - IPv4 is 32bit and isn't as widely used as technology advances - They're running out. IPv6, in the other hand, is 128bit and pulls more unique addresses which means it can be used in much wider network complexes.

### MAC addresses

#### It's Responsible for local identification within a 'LAN'. In other words, this is the address you use when running things in your local network.

*They also ensure that your devices make connections with the correct device.*

### Ports & Protocols

#### Example: 

*Like logical doors on your device - each door is numbered and each number is used for a specific type of network communication.*

#### The 'doors' are called *Ports* 

*These ports are responsible for being the gateway for communication - to send or recieve data, meaning that data goes to the right place.*

#### **Protocols**

#### A set of rules on how connected devices communicate in an easy and safe manner e.g. in formatting and processing data.

### Sum up:

**PORTS** = Ensure data gets to the right place

**Protocols** = Ensure Devices understand eachother 

## Type of Protocols

### TCP

1. **Characteristics:**

- It's connection orrientated - meaning that it only works if there is a connection between devices:
- Requires a 'TLS Handshake' - meaning that both devices agree to recieve or transfer data packets
- Reliable data transfer - if some data is lost in-transit, then TCP ensures that data is resent.

2. **Functions:** 
- Data is sent in order - the way it was sent is exactly the way it'll be recieved 
- Error checking & flow control to prevent congestion

3. **Uses:**
- Emailing
- Web search
- Texting 
- File transfer 
-----> *Essesntially, any process where reliable transfer of data takes precedence.*

### UDP

- Not connection orrientated 
- Much quicker than TCPs - as it doesnt require any initial agreement between devices where both parties can exchange data.

---> *Less reliable than TCP - as no guarantee that all data will reach the other device + no built in error-checks*

**Functions**

- Suitable for Real-time applications e.g. multiplayer games or live streaming
- Used in DNS and VPN

-----> *Essentially, where speed takes precedence over reliability*

# The OSI Model

#### The standard communication model of the steps that data goes through to go from one device to the other

#### Layers:

### Layer 1: Physical

**Components**

- Cables
- Switches
- Network Interface Cards

**Function**

*"Transfers raw bit streams through a physical medium"* in the form of:
- Wifi
- Radio Waves
- Light waves
- Fibre
- Electrical Signals

Now we've got a problem: If we only rely on this layer then data will be processed by all existing devices.
*Here's the solution to give direction to the data being processed:*

### Layer 2: Data Links

*Quick definition: A node is a device which acts a s a connection point to send and recieve data.*

Provides node-node data transfer - this is done by maintaining a reliable link between nodes (devices) - more organised than the physical layer where data is spread randomly.

*This layer puts data into frames which helps package the data - thus more organised.*

**Examples**

- Mac Address
- Switches
- Bridges - network device which connects multiple subnetworks to single network = facilitates communication

#### But now the data is organised properly, where is it going to go?

### Layer 3: Network Layer

#### Determines how data is sent to the device - designs the best path that a packet could take to successfully reach the device.

- Manages **packet forwarding** - direction the packet takes to get to its destination
- Manages **Packet Routing** 

**Examples**

- IP addresses
- Routers

#### Now the packet knows where to go, whats going to take it there?

### Layer 4: Transport Layer

#### The 'Delivery service' of data packets.

**Examples**

- IP packets from layer 3 is assembled into TCP or UDP segments.

### Layer 5: Session Layer

- Establishing Connections 
- Maintaining Connections 
- Terminating Connections 

### Layer 6: Presentation Layer

#### The 'Syntax' Layer

- Translates data between application and network layer
- Ensures data is in usable format

#### Components
- Encryption
- Data Formatting

#### Now since the raw data has been transported, connected and translated - What's the goal here?

### Layer 7: Application Layer

#### The 'End user Layer' 
*The reason it's called this is because this layer is basically whatever you interact with as a user e.g. https for web search; ftp for file transfer; ssh for instance access etcetc.*
