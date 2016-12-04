# compute the nth fib number using memoization approach
def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  fib_memo(n, [0, 1])
end

def fib_memo(n, fibs)
  next_fib = fibs[fibs.length - 1] + fibs[fibs.length - 2]
  n == fibs.length ? (return next_fib) : (return fib_memo(n, fibs.push(next_fib)))
end

(0..10).each do |i|
  puts fib(i)
end
