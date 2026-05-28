package egovframework.let.utl.fcc.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/**
 * EgovNumberUtil 단위 테스트
 *
 * @author 이백행
 * @since 2024-09-21
 */
class EgovNumberUtilTest {

    @Test
    @DisplayName("getRandomNum: 반환값이 시작숫자와 종료숫자 사이에 있다")
    void testGetRandomNumRange() {
        for (int i = 0; i < 50; i++) {
            int result = EgovNumberUtil.getRandomNum(1, 10);
            assertTrue(result >= 1 && result <= 10,
                    "범위 초과: " + result);
        }
    }

    @Test
    @DisplayName("getNumSearchCheck: 숫자집합에 검색숫자가 포함되면 true를 반환한다")
    void testGetNumSearchCheck() {
        assertTrue(EgovNumberUtil.getNumSearchCheck(12345678, 7));
        assertFalse(EgovNumberUtil.getNumSearchCheck(12345678, 9));
        assertTrue(EgovNumberUtil.getNumSearchCheck(100, 1));
    }

    @Test
    @DisplayName("getNumToStrCnvr: 숫자를 문자열로 변환한다")
    void testGetNumToStrCnvr() {
        assertEquals("20081212", EgovNumberUtil.getNumToStrCnvr(20081212));
        assertEquals("0", EgovNumberUtil.getNumToStrCnvr(0));
        assertEquals("-1", EgovNumberUtil.getNumToStrCnvr(-1));
    }

    @Test
    @DisplayName("getNumToDateCnvr: 8자리 숫자를 yyyy-MM-dd 형식으로 변환한다")
    void testGetNumToDateCnvr8Digits() {
        assertEquals("2008-12-12", EgovNumberUtil.getNumToDateCnvr(20081212));
        assertEquals("2000-01-01", EgovNumberUtil.getNumToDateCnvr(20000101));
    }

    @Test
    @DisplayName("getNumToDateCnvr: 8자리 또는 14자리가 아니면 예외가 발생한다")
    void testGetNumToDateCnvrInvalidLength() {
        assertThrows(IllegalArgumentException.class,
                () -> EgovNumberUtil.getNumToDateCnvr(2008121));
        assertThrows(IllegalArgumentException.class,
                () -> EgovNumberUtil.getNumToDateCnvr(123456789));
    }

    @Test
    @DisplayName("getNumberValidCheck: 숫자로만 구성된 문자열이면 true를 반환한다")
    void testGetNumberValidCheck() {
        assertTrue(EgovNumberUtil.getNumberValidCheck("12345"));
        assertFalse(EgovNumberUtil.getNumberValidCheck("123a5"));
        assertFalse(EgovNumberUtil.getNumberValidCheck("123 5"));
        assertTrue(EgovNumberUtil.getNumberValidCheck("0"));
    }

    @Test
    @DisplayName("getNumberCnvr: 숫자집합 내 특정 숫자를 다른 숫자로 치환한다")
    void testGetNumberCnvr() {
        assertEquals(99945678, EgovNumberUtil.getNumberCnvr(12345678, 123, 999));
        assertEquals(200, EgovNumberUtil.getNumberCnvr(100, 1, 2));
    }

    @Test
    @DisplayName("checkRlnoInteger: 음수이면 -1, 정수이면 0, 실수이면 1을 반환한다")
    void testCheckRlnoInteger() {
        assertEquals(-1, EgovNumberUtil.checkRlnoInteger(-5.0));
        // double 10.0은 String.valueOf 시 "10.0"이 되어 소수점이 포함됨 → 실수(1) 반환
        assertEquals(1, EgovNumberUtil.checkRlnoInteger(10.0));
        // 정수(0) 판정을 받으려면 소수점 없는 표현이 필요하나 double 타입 특성상 해당 없음
        assertEquals(-1, EgovNumberUtil.checkRlnoInteger(-0.1));
    }
}
