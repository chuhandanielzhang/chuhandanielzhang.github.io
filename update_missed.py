import glob

files = glob.glob('/Users/daniel/Desktop/phd/website/*.html')

for filepath in files:
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Check for missed "Interests & Hobbies" and update to "Beyond Academics" with camera emoji
    content = content.replace('<span class="icon">🎨</span>Interests & Hobbies', '<span class="icon">📸</span>Beyond Academics')
    content = content.replace('<span class="icon">🎨</span>Beyond Academics', '<span class="icon">📸</span>Beyond Academics')
    
    with open(filepath, 'w') as f:
        f.write(content)
    print(f"Updated {filepath}")

print("Done!")
