%% Matlab basics

clear;
close all;

%% Assignment

a = 1
b = 2
c = a + b

d = 3 + i

e = sin(a)

% Use a semicolon to surpress output.

%% Vectors/Arrays

% Matlab is 1-indexed

a = [1 2 3 4];
b = [5 6 7 8];

%a(0)
a(1)
a(1:3)

% Add vectors together?
a + b

% concatenate with square brackets
[a b]

% How to define a range?
% xs = start:increment:end
xs = 0:1:10

% apostrophe transposes
xs'

% QUESTION: How to multiply?

%% Useful functions

n=10;
zeros(n) % = zeros(n,n)
zeros(3,4) % = zeros([3 4])

% Similar for ones
arr = ones(3,4)

% Get size of array
size(arr)
length(arr)

% Also, mathematical functions exist.
r = randperm(15,5);

% They're kind of weird.
% Return depends on the left side of the equal sign?
maxR = max(r);
[maxR, location] = max(r);

% If you have time, look into logical indexing.
% Can you produce a vector that contains only the odd values of r?

%% Plotting

% need an x vector and a y vector

x = 0:0.01:4*pi;
y = 2*sin(x); %Automagically vectorized functions!

plot(x,y)
title('Sine Wave')
xlabel('\Theta')

%% More complicated plotting

hold on
plot(x, 2*cos(x), 'r--')
legend('sin', 'cos')
hold off

%% Audio file!

filename = 'RecordedVoice.wav';
[y,freq] = audioread(filename);
sound(y, freq);
t = 0:1/freq:(length(y) - 1)/freq;
plot(t,y);

%% fast fourier transforms!

fsampling = 100; %sampling rate
t = 0:1/fsampling:2*pi;
f1 = 20; %frequency
x = cos(2*pi*t*f1);
L = length(x);

X = fft(x);
X = X/length(x);
omega = ((0:length(X)-1)/length(X))*fsampling; %define frequency axis

subplot(3,1,1) % let's you put multiple plots on the same figure
plot(t,x);
title('signal x(t) in the time domain');
xlabel(sprintf('t, sampled at the rate of %d', fsampling));
ylabel('y(t)');
ylim([-1.5,1.5]);
xlim([0,2*pi]);

subplot(3,1,2)
plot(omega, abs(X));
title('signal X(\omega), magnitude')

subplot(3,1,3)
plot(omega, angle(X))
title('signal X(\omega), phase')
% hey! why is this a complex number?

% what else can you throw into fft? Why do they look different?
% try a sin wave, a cos wave, a square wave. Try that audio file!
% what happens when you change the sampling rate?

% what happens if you're above or below the nyquist frequency?

%% Bonus: Yes, you can use c-style string formatting with Matlab.
% Don't worry about this if you're not familiar with c-style string formatting
% but the function is sprintf

