# 🤖 Robot Framework Project

This project uses [Robot Framework](https://robotframework.org/) to implement test automation using `.robot` files.

## 📋 Requirements

- Python **3.12** or later
- Robot Framework **7**
- pip (Python package manager)

## 🛠 How to Set Up & Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```
## 🧑‍💻 How to Open and Run in PyCharm
### 2. Install Python and Robot Framework
Step 1: Open the Project
>> Open PyCharm
>> Click File > Open and select the project directory

Step 2: Set Up Python Interpreter
>> Go to File > Settings > Project > Python Interpreter
>> Select Python 3.12+ interpreter or set up a virtual environment

Step 3: Install Robot Framework Support Plugin (Optional but Recommended)
>> Go to File > Settings > Plugins
>> Search for Robot Framework Support
>> Install and restart PyCharm

Step 4: Run Tests from Terminal (Inside PyCharm)
>> Use the built-in PyCharm terminal:
 ```bash
robot -d output tests/sample_test.robot
```
Or use python -m robot ... as noted above if needed.

Step 5: (Optional) Create a Run Configuration
>> Go to Run > Edit Configurations
>> Add a new Python configuration:
> Script path: robot
> Parameters: -d output tests/sample_test.robot
> Working directory: Project root
>> Click OK and then Run

## 🙏 Credits
Special thanks to Sharika Nargis for the excellent tutorial series.
