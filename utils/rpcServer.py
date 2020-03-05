from SimpleXMLRPCServer import SimpleXMLRPCServer
from miniDVM import miniDVM
def startRPCServer():
	server = SimpleXMLRPCServer(("localhost", 8000))
	print("Listening on port 8000...")
	server.register_multicall_functions()
	dvm=miniDVM()
	server.register_function(dvm.exec1, 'exec1')
	server.serve_forever()
if __name__ == '__main__':
	startRPCServer()