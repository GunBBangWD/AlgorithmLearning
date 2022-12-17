public class Main {
    public static void main(String[] args) {
       // Solution test = new Solution();
        //System.out.println(test.solution(3,4));
        System.out.println("hello");
    }
}

/* level 0 각도기 풀이 완
class Solution {
    public int solution(int angle) {
        int answer = 0;
        boolean val = (0<=angle && 180>=angle);
        if(val){
            if(0<angle && 90>angle)answer=1;
            else if(90==angle)answer=2;
            else if(90<angle && 180>angle)answer=3;
            else answer=4;
        }
        return answer;
    }
}


/* level 0 두 수의 합 풀이 완
class Solution {
    public int solution(int num1, int num2) {
        int answer = -1;
        boolean val = (-50000<=num1 && 50000>=num1 && -50000<=num2 && 50000>=num2);
        if(val)answer = num1+num2;
        return answer;
    }
}

/* level 0 두 수의 차 풀이 완
class Solution {
    public int solution(int num1, int num2) {
        int answer = 0;
        boolean val = (-50000<=num1 && 50000>=num1 && -50000<=num2 && 50000>=num2);
        if(val){answer = num1-num2;}
        return answer;
    }
}

/* level 0 나이 출력 풀이 완
class Solution {
    public int solution(int age) {
        int answer = 0;
        boolean val = (0<=age && 120>=age);
        if(val){answer = 2022-age+1;}
        return answer;
    }
}

/* level 0 두 수를 나눈 몫 풀이 완
class Solution {
    public int solution(int num1, int num2) {
        int answer = 0;
        if(0<=num1 && 100>=num1 && 0<=num2 && 100>=num2){
            answer = num1/num2;
        }
        return answer;
    }
}

/* level 0 두 수의 곱 풀이 완
class Solution {
    public int solution(int num1, int num2) {
        int answer=0;
        if(0<=num1 && 100>=num1 && 0<=num2 && 100>=num2) {
            answer = num1 * num2;
        }
        return answer;
    }
}

/* level 0 숫자 비교하기 풀이완
class Solution {
    public int solution(int num1, int num2) {
        int answer = (num1==num2)?1:-1;
        return answer;
    }
}

 */