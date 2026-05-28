package egovframework.let.utl.fcc.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/**
 * EgovDateUtil 단위 테스트
 *
 * @author 이백행
 * @since 2024-09-21
 */
class EgovDateUtilTest {

    @Test
    @DisplayName("addYearMonthDay: 날짜에 연월일을 가감한다")
    void testAddYearMonthDay() {
        assertEquals("19810916", EgovDateUtil.addYearMonthDay("19810828", 0, 0, 19));
        assertEquals("20060218", EgovDateUtil.addYearMonthDay("20060228", 0, 0, -10));
        assertEquals("20060310", EgovDateUtil.addYearMonthDay("20060228", 0, 0, 10));
        assertEquals("20050228", EgovDateUtil.addYearMonthDay("20050331", 0, -1, 0));
        assertEquals("20060301", EgovDateUtil.addYearMonthDay("20040229", 2, 0, 1));
    }

    @Test
    @DisplayName("addYear: 연도를 가감한다")
    void testAddYear() {
        assertEquals("20620201", EgovDateUtil.addYear("20000201", 62));
        assertEquals("20000201", EgovDateUtil.addYear("20620201", -62));
        assertEquals("20060228", EgovDateUtil.addYear("20040229", 2));
    }

    @Test
    @DisplayName("addMonth: 월을 가감한다")
    void testAddMonth() {
        assertEquals("20020201", EgovDateUtil.addMonth("20010201", 12));
        assertEquals("20050228", EgovDateUtil.addMonth("20040229", 12));
        assertEquals("20060228", EgovDateUtil.addMonth("20060131", 1));
    }

    @Test
    @DisplayName("addDay: 일을 가감한다")
    void testAddDay() {
        assertEquals("20000201", EgovDateUtil.addDay("19991201", 62));
        assertEquals("19991201", EgovDateUtil.addDay("20000201", -62));
        assertEquals("20050903", EgovDateUtil.addDay("20050831", 3));
    }

    @Test
    @DisplayName("getDaysDiff: 두 날짜 사이의 일 수 차이를 반환한다")
    void testGetDaysDiff() {
        assertEquals(10, EgovDateUtil.getDaysDiff("20060228", "20060310"));
        assertEquals(365, EgovDateUtil.getDaysDiff("20060101", "20070101"));
        assertEquals(-28, EgovDateUtil.getDaysDiff("19990228", "19990131"));
        assertEquals(0, EgovDateUtil.getDaysDiff("20060801", "20060801"));
    }

    @Test
    @DisplayName("checkDate: 유효한 날짜이면 true를 반환한다")
    void testCheckDate() {
        assertTrue(EgovDateUtil.checkDate("20060228"));
        assertTrue(EgovDateUtil.checkDate("2006-02-28"));
        assertFalse(EgovDateUtil.checkDate("1999-02-35"));
        assertFalse(EgovDateUtil.checkDate("2000-13-31"));
        assertFalse(EgovDateUtil.checkDate("2006-11-31"));
    }

    @Test
    @DisplayName("formatDate: yyyyMMdd(8자리) 날짜 문자열을 지정 구분자로 포맷한다")
    void testFormatDate() {
        assertEquals("2003.04.05", EgovDateUtil.formatDate("20030405", "."));
        assertEquals("2004/01/01", EgovDateUtil.formatDate("20040101", "/"));
    }

    @Test
    @DisplayName("formatDate: 월이 00이면 연도만 반환한다")
    void testFormatDateMonthZero() {
        assertEquals("2003", EgovDateUtil.formatDate("20030000", "."));
    }

    @Test
    @DisplayName("validChkTime: 콜론 포함 5자리(HH:MM)를 4자리(HHMM)로 정규화한다")
    void testValidChkTime() {
        assertEquals("1512", EgovDateUtil.validChkTime("15:12"));
        assertEquals("0905", EgovDateUtil.validChkTime("0905"));
    }

    @Test
    @DisplayName("validChkDate: null이거나 길이가 8/10이 아니면 예외가 발생한다")
    void testValidChkDateException() {
        assertThrows(IllegalArgumentException.class,
                () -> EgovDateUtil.validChkDate(null));
        // 길이가 7인 경우 예외
        assertThrows(IllegalArgumentException.class,
                () -> EgovDateUtil.validChkDate("2006228"));
    }

    @Test
    @DisplayName("validChkDate: yyyy-MM-dd 형식이면 하이픈을 제거하고 반환한다")
    void testValidChkDate() {
        assertEquals("20060228", EgovDateUtil.validChkDate("2006-02-28"));
        assertEquals("20060228", EgovDateUtil.validChkDate("20060228"));
    }

    @Test
    @DisplayName("getToday: 오늘 날짜를 yyyyMMdd 형식으로 반환한다")
    void testGetToday() {
        String today = EgovDateUtil.getToday();
        assertNotNull(today);
        assertEquals(8, today.length());
        assertTrue(today.matches("\\d{8}"));
    }

    @Test
    @DisplayName("convertWeek: 영문 요일명을 국문으로 변환한다")
    void testConvertWeek() {
        assertEquals("일요일", EgovDateUtil.convertWeek("SUN"));
        assertEquals("월요일", EgovDateUtil.convertWeek("MON"));
        assertEquals("화요일", EgovDateUtil.convertWeek("TUE"));
        assertEquals("수요일", EgovDateUtil.convertWeek("WED"));
        assertEquals("목요일", EgovDateUtil.convertWeek("THR"));
        assertEquals("금요일", EgovDateUtil.convertWeek("FRI"));
        assertEquals("토요일", EgovDateUtil.convertWeek("SAT"));
    }

    @Test
    @DisplayName("getRandomDate: 반환된 날짜가 시작일자와 종료일자 사이에 있다")
    void testGetRandomDate() {
        String result = EgovDateUtil.getRandomDate("20200101", "20201231");
        assertNotNull(result);
        assertEquals(8, result.length());
        assertTrue(result.compareTo("20200101") >= 0);
        assertTrue(result.compareTo("20201231") <= 0);
    }

    @Test
    @DisplayName("getRandomDate: 종료일자가 시작일자보다 이전이면 예외가 발생한다")
    void testGetRandomDateInvalidRange() {
        assertThrows(IllegalArgumentException.class,
                () -> EgovDateUtil.getRandomDate("20201231", "20200101"));
    }
}
