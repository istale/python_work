import os

for root, dirs, files in os.walk("/Users/istale/Downloads/XMindPortable"):
	for file in files:
		if file.endswith(".cpy"):
			full_file_name = os.path.join(root,file)
			print(full_file_name)
			#os.rename(full_file_name, full_file_name.replace(".py", ".cpy"))
