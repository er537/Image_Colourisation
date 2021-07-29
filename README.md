# Image_Colourisation

This project aims to recolour an image from a small amount of colour information at a few chosen pixels.

\Versions contains a Windows and a Mac version of this code. Extract the appropriate version for your opererating system, then:

Run demo.m in MATLAB and a GUI will appear. Press upload to upload an image of your choice. Some samples are given in \Picture. Select your colour information and press the 'Colour Information' button. This extracts the colour information at some percentage of pixles, leaving the rest of the image greyscale. Then select hyperparameters (the default ones are optimum) and press 'Colourisation' to recolour the image. 

If you wish to determine your own optimum hyperparmeters, optimiser.m can be used with an image of your choice. This will optimize the colourization function, returning the optimum hyperparameters for that image. 