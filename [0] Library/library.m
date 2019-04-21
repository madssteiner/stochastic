smp.pdfarea = @pdfarea;
smp.cdfhist = @cdfhist;
smp.pdfhist = @pdfhist;
smp.cdfplot = @cdfplot;
smp.stddev = @stddev;
smp.mean = @mean;
smp.randdist = @randdist;

save('[0] Library/library.mat', '-struct', 'smp');