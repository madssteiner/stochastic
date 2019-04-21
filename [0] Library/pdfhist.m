function [h] = pdfhist(array, bins)
%CDFHIST plots the cummulative distribution function as a histogram with
%bins
h = histogram(array, bins, 'Normalization', 'pdf');
end