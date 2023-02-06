public class Main {
    public static void main(String[] args) {
       // Solution test = new Solution();
        //System.out.println(test.solution(3,4));
        System.out.println("hello");
    }
}





/* 대문자와 소문자
class Solution {
    public String solution(String my_string) {
        String answer = "";
        char ch;
        StringBuilder sb = new StringBuilder(my_string);
        for(int i=0;i<my_string.length();i++){
            ch=my_string.charAt(i);
            if(Character.isUpperCase(ch)) sb.setCharAt(i,Character.toLowerCase(ch));
            else if(Character.isLowerCase(ch)) sb.setCharAt(i,Character.toUpperCase(ch));
        }
        return sb.toString();
    }
}


/* 개미군단
class Solution {
    public int solution(int hp) {
        return hp/5+(hp%5)/3+(hp%5)%3;
    }
}

/* 숨어있는 숫자의 덧셈
class Solution {
    public int solution(String my_string) {
        int answer = 0;
        int num;
        for(int i=0;i<my_string.length();i++){
            num=my_string.charAt(i);
            if(num>=48 && num<=57) answer+=num-'0';
        }
        return answer;
    }
}
/* 문자열 포함 확인
class Solution {
    public int solution(String str1, String str2) {
        int answer = 2;
        for(int i=0;i<=str1.length()-str2.length();i++){
            if(str1.substring(i,i+str2.length()).equals(str2)) answer=1;
        }
        return answer;
    }
}

/* 배열 유사도
class Solution {
    public int solution(String[] s1, String[] s2) {
        int answer = 0;
        for(int i=0;i<s1.length;i++){
            for(int j=0;j<s2.length;j++){
                if(s1[i].equals(s2[j])) answer++;
            }
        }
        return answer;
    }
}

/*옷가게 할인받기
class Solution {
    public int solution(int price) {
        int answer = 0;
        return price<100000 ? price: price<300000 ? price*95/100 : price<500000 ? price*90/100 : price*80/100;
    }
}
/* 배열 두배 만들기
import java.util.stream.IntStream;
class Solution {
    public int[] solution(int[] numbers) {
        return IntStream.range(0,numbers.length).map(i -> numbers[i]*2).toArray();
    }
}

/* 삼각형의 완성조건

class Solution {
    public int solution(int[] sides) {
        int answer = 0;
        for(int i=1;i<sides.length;i++){
            if(sides[i-1]>sides[i]){
                answer=sides[i-1];
                sides[i-1]=sides[i];
                sides[i]=answer;
            }
        }
        return sides[2]<sides[0]+sides[1] ? 1 : 2;
    }
}

/* 짝수는 싫어요
import java.util.stream.IntStream;
class Solution {
    public int[] solution(int n) {
        return IntStream.range(1, n+1)
                .filter(i -> i % 2 == 1)
                .toArray();
    }
}

/* 문자제거
class Solution {
    public String solution(String my_string, String letter) {
        return my_string.replaceAll(letter,"");
    }
}

/* 피자 나누기
class Solution {
    public int solution(int slice, int n) {
        return (n%slice == 0) ? n/slice : n/slice+1;
    }
}

/* 아이스아메리카노
class Solution {
    public int[] solution(int money) {
        int[] answer = new int[2];
        answer[0]=money/5500;
        answer[1]=money%5500;
        return answer;
    }
}

/* 문자 반복
class Solution {
    public String solution(String my_string, int n) {
        String answer = "";
        for(int i=0;i<my_string.length();i++){
            for(int j=0;j<n;j++){
                answer = answer+my_string.charAt(i);
            }
        }
        return answer;
    }
}

/* 배열 자르기
class Solution {
    public int[] solution(int[] numbers, int num1, int num2) {
        int[] answer = new int[num2-num1+1];
        for(int i=0;i<answer.length;i++){
            answer[i]=numbers[num1+i];
        }
        return answer;
    }
}

/*  level 0 문자열 뒤집기
class Solution {
    public String solution(String my_string) {
        String answer = "";
        for(int i=my_string.length()-1;i>=0;i--){
            answer=answer+my_string.charAt(i);
        }
        return answer;
    }
}

/*
class Solution {
    public int[] solution(int[] num_list) {
        int[] answer = new int[2];
        for(int i=0;i<num_list.length;i++){
            if(num_list[i]%2==0) answer[0]++;
            else answer[1]++;
        }
        return answer;
    }
}
/* level 0 짝수의 합 풀이완
class Solution {
    public int solution(int[] dot) {
        int answer = 0;
        answer = dot[0]>0 ? (dot[1]>0 ? 1 : 4) : (dot[1]>0 ? 2 : 3);
        return answer;
    }
}

/* level 0 짝수의 합 풀이완
class Solution {
    public int solution(int n) {
        int answer = 0;
        boolean val = (0<n && 1000>=n);
        if(val){
            if(n<=1){
                return 0;
            }
            if(n%2==0){
                answer=n+solution(n-1);
            }else{
                answer=solution(n-1);
            }
        }
        return answer;
    }
}

/* level 0 두 수의 나누셈  1000곱 후 정수표기
class Solution {
    public int solution(int num1, int num2) {
        int answer = 0;
        boolean val = (0<num1 && 100>=num1 && 0<num2 && 100>=num2);
        answer=(int)((double)num1/(double)num2*1000);
        return answer;
    }
}

/* 치킨쿠폰 풀이 완
class Solution {
    public int solution(int chicken) {
        int answer = 0;
        boolean val = (0<=chicken && 1000000>=chicken);
        if(val){
            while(chicken>=10){
            answer += chicken/10;
            chicken = (chicken/10)+(chicken%10);
            }
        }
        return answer;
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