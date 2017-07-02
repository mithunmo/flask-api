# under normal circumstances, this script would not be necessary. the
# sample_application would have its own setup.py and be properly installed;
# however since it is not bundled in the sdist package, we need some hacks
# to make it work

import os
import sys

sys.path.append(os.path.dirname(__name__))

from __init__ import create_app

# create an app instance
app = create_app()

port = os.getenv('PORT', '5000')
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=int(port))

#app.run(debug=True)