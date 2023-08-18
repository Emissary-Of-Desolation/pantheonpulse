import os

def create_folders(directory_path, num_folders):
    for i in range(1, num_folders + 1):
        folder_name = f"day {i}"
        folder_path = os.path.join(directory_path, folder_name)
        os.makedirs(folder_path)
        print(f"Created folder: {folder_path}")

if __name__ == "__main__":
    directory_path = r"C:\Users\robin\Flutter_Projects\gymprotocol\assets\protocol1"  # Replace this with your desired directory path
    num_folders = 30
    create_folders(directory_path, num_folders)
