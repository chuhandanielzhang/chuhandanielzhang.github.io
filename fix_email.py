import glob

files = glob.glob('/Users/daniel/Desktop/phd/website/*.html')

for filepath in files:
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Fix the messed up email and links
    content = content.replace('Technion China_EDU_CN_TEMP', 'gtiit.edu.cn')
    
    with open(filepath, 'w') as f:
        f.write(content)
    print(f"Updated {filepath}")

print("Done!")
