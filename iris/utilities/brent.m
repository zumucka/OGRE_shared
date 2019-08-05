function [x,fx,flag] = brent(f,lb,ub)

tolX    = 1e-6;
iterMax = 1e4;
a = lb;
b = ub;
fa = f(a);
fb = f(b);

% swap endpoints
if abs(fa)<abs(fb)
    b = lb; a = ub;
    x = fa; fa = fb; fb = x;
end
c = a;
fc = fa;
mflag = true;
d = 0;
iter = 0;
convergence = false;
flag = 1;

% loop
try
    while ~convergence && iter<iterMax
        convergence = abs(b-a)<tolX;
        if fa~=fc && fb~= fc
            % use inverse quadratic interopolation
            x = a*fb*fc/((fa-fb)*(fa-fc)) + b*fa*fc/((fb-fa)*(fb-fc)) + c*fa*fb/((fc-fa)*(fc-fb));
        else
            % secant method
            x = b - fb*(b-a)/(fb-fa);
        end
        % checks to see whether we can use the faster converging quadratic && secant methods or if we need to use bisection
        if x<(3*a+b)*.25 || x>b || mflag&&abs(x-b)>=abs(b-c)*.5 || ~mflag&&abs(x-b)>=abs(c-d)*.5 || mflag&&abs(b-c)<tolX || ~mflag&&abs(c-d)<tolX
            % bisection method
            x = .5*(a+b); 
            mflag = true;
        else
            mflag = false;
        end
        fx = f(x);
        d = c;
        c = b;
        fc = fb;
        iter = iter+1;
        % check opposite signs
        if fa*fx<0
            b = x;
            fb = fx;
        else
            a = x;
            fa = fx;
        end
        % swap, if needed
        if abs(fa)<abs(fb)
            y = b; b = a; a = y;
            y = fa; fa = fb; fb = y;
        end
    end
    assert(convergence);
catch err %#ok<NASGU>
    flag = 0;
    fx = NaN;
end

end
