# count how many times a child can run up n steps if that child can
# move up 1, 2, or 3 steps at a time
#
def triple_step(n, memo = {})
  # base cases
  return 0 if n < 0
  return 1 if n == 0

  # non-memoized recursive solution
  # triple_step(n - 1) + triple_step(n - 2) + triple_step(n - 3)

  # memoized solution
   return memo[n] if memo[n]
   memo[n] = triple_step(n - 1) + triple_step(n - 2) + triple_step(n - 3)
end

10.times do |i|
  puts "#{i} steps: #{triple_step(i)} ways"
end
