class Generate

      def initialize(filename)

          @filename = filename

      end

      def between(num, li, ls)
        
          @howmuch = num
          @li = li
          @ls = ls

      end

      def solve() 

          @generatedNumbers = gen(@howmuch, @li, @ls)

      end 

      def writeToFile() 

          f = File.open(@filename,"w")
 
          (0..@howmuch).each do |i|

              f.write(@generatedNumbers[i]) 

              f.write(" ") 

          end 

          f.close()

      end 

      def gen(num, li, ls)
 
          r = Random.new

          taken = []

          (1..num).each do |i|

              n = r.rand(li..ls)
  
              while taken.index( n )

                  n = r.rand(li..ls)

              end 

              taken.push(n)  

          end 

          return taken
      end
end

num, li, ls = ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i

ob = Generate.new("input.in")

ob.between(num, li, ls)

ob.solve()

ob.writeToFile()


