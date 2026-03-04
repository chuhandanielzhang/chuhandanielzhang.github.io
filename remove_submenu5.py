import glob
import re

files = glob.glob('/Users/daniel/Desktop/phd/website/*.html')

for filepath in files:
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Remove any remaining sidebar-sublink elements that might be span tags instead of a tags
    content = re.sub(r'\s*<span class="sidebar-sublink"[^>]*>.*?</span>', '', content, flags=re.DOTALL)
    
    with open(filepath, 'w') as f:
        f.write(content)
    print(f"Updated {filepath}")

print("Done!")
