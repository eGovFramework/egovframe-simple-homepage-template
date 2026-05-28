package egovframework.let.utl.fcc.service;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/**
 * EgovStringUtil 단위 테스트
 *
 * @author 이백행
 * @since 2024-09-21
 */
class EgovStringUtilTest {

    @Test
    @DisplayName("isEmpty: null 또는 빈 문자열이면 true를 반환한다")
    void testIsEmpty() {
        assertTrue(EgovStringUtil.isEmpty(null));
        assertTrue(EgovStringUtil.isEmpty(""));
        assertFalse(EgovStringUtil.isEmpty(" "));
        assertFalse(EgovStringUtil.isEmpty("abc"));
    }

    @Test
    @DisplayName("cutString: 지정 길이 초과 시 잘라낸 후 suffix를 붙인다")
    void testCutStringWithSuffix() {
        assertEquals("Hel...", EgovStringUtil.cutString("Hello World", "...", 3));
        assertEquals("Hi", EgovStringUtil.cutString("Hi", "...", 5));
        assertNull(EgovStringUtil.cutString(null, "...", 3));
    }

    @Test
    @DisplayName("cutString: 지정 길이 초과 시 잘라낸다")
    void testCutStringNoSuffix() {
        assertEquals("Hel", EgovStringUtil.cutString("Hello", 3));
        assertEquals("Hi", EgovStringUtil.cutString("Hi", 5));
        assertNull(EgovStringUtil.cutString(null, 3));
    }

    @Test
    @DisplayName("remove: 특정 문자를 모두 제거한다")
    void testRemove() {
        assertEquals("qeed", EgovStringUtil.remove("queued", 'u'));
        assertEquals("queued", EgovStringUtil.remove("queued", 'z'));
        assertNull(EgovStringUtil.remove(null, 'u'));
        assertEquals("", EgovStringUtil.remove("", 'u'));
    }

    @Test
    @DisplayName("removeCommaChar: 콤마를 모두 제거한다")
    void testRemoveCommaChar() {
        assertEquals("asdfgqweqe", EgovStringUtil.removeCommaChar("asdfg,qweqe"));
        assertNull(EgovStringUtil.removeCommaChar(null));
        assertEquals("", EgovStringUtil.removeCommaChar(""));
    }

    @Test
    @DisplayName("removeMinusChar: 마이너스를 모두 제거한다")
    void testRemoveMinusChar() {
        assertEquals("asdfgqweqe", EgovStringUtil.removeMinusChar("a-sdfg-qweqe"));
        assertNull(EgovStringUtil.removeMinusChar(null));
    }

    @Test
    @DisplayName("replace: 모든 대상 문자열을 치환한다")
    void testReplace() {
        assertEquals("bcbc", EgovStringUtil.replace("aaaa", "aa", "bc"));
        assertEquals("hello world", EgovStringUtil.replace("hello java", "java", "world"));
    }

    @Test
    @DisplayName("replaceOnce: 첫 번째 대상 문자열만 치환한다")
    void testReplaceOnce() {
        assertEquals("Xbab", EgovStringUtil.replaceOnce("abab", "a", "X"));
        assertEquals("noop", EgovStringUtil.replaceOnce("noop", "z", "X"));
    }

    @Test
    @DisplayName("indexOf: 검색 대상 위치를 반환하며 null이면 -1을 반환한다")
    void testIndexOf() {
        assertEquals(2, EgovStringUtil.indexOf("aabaabaa", "b"));
        assertEquals(0, EgovStringUtil.indexOf("aabaabaa", "a"));
        assertEquals(-1, EgovStringUtil.indexOf(null, "a"));
        assertEquals(-1, EgovStringUtil.indexOf("abc", null));
    }

    @Test
    @DisplayName("lowerCase: 소문자로 변환한다")
    void testLowerCase() {
        assertEquals("abc", EgovStringUtil.lowerCase("aBc"));
        assertEquals("", EgovStringUtil.lowerCase(""));
        assertNull(EgovStringUtil.lowerCase(null));
    }

    @Test
    @DisplayName("upperCase: 대문자로 변환한다")
    void testUpperCase() {
        assertEquals("ABC", EgovStringUtil.upperCase("aBc"));
        assertEquals("", EgovStringUtil.upperCase(""));
        assertNull(EgovStringUtil.upperCase(null));
    }

    @Test
    @DisplayName("removeWhitespace: 모든 공백을 제거한다")
    void testRemoveWhitespace() {
        assertEquals("abc", EgovStringUtil.removeWhitespace("   ab  c  "));
        assertEquals("abc", EgovStringUtil.removeWhitespace("abc"));
        assertNull(EgovStringUtil.removeWhitespace(null));
        assertEquals("", EgovStringUtil.removeWhitespace(""));
    }

    @Test
    @DisplayName("split: 구분자로 문자열을 배열로 분리한다")
    void testSplit() {
        assertArrayEquals(new String[]{"a", "b", "c"}, EgovStringUtil.split("a,b,c", ","));
        assertArrayEquals(new String[]{"hello"}, EgovStringUtil.split("hello", ","));
    }

    @Test
    @DisplayName("stripStart: 앞쪽 지정 문자를 제거한다")
    void testStripStart() {
        assertEquals("abc  ", EgovStringUtil.stripStart("yxabc  ", "xyz"));
        assertEquals("abc", EgovStringUtil.stripStart("  abc", null));
        assertNull(EgovStringUtil.stripStart(null, null));
    }

    @Test
    @DisplayName("stripEnd: 뒤쪽 지정 문자를 제거한다")
    void testStripEnd() {
        assertEquals("  abc", EgovStringUtil.stripEnd("  abcyx", "xyz"));
        assertEquals("abc", EgovStringUtil.stripEnd("abc  ", null));
        assertNull(EgovStringUtil.stripEnd(null, null));
    }

    @Test
    @DisplayName("addMinusChar: 8자리 날짜에 하이픈을 추가한다")
    void testAddMinusChar() {
        assertEquals("2010-09-01", EgovStringUtil.addMinusChar("20100901"));
        assertEquals("", EgovStringUtil.addMinusChar("2010090"));
    }

    @Test
    @DisplayName("decode: 두 문자열이 같으면 returnStr, 다르면 defaultStr을 반환한다")
    void testDecode4Args() {
        assertEquals("foo", EgovStringUtil.decode(null, null, "foo", "bar"));
        assertEquals("bar", EgovStringUtil.decode("", null, "foo", "bar"));
        assertEquals("foo", EgovStringUtil.decode("하이", "하이", "foo", "bar"));
        assertEquals("bar", EgovStringUtil.decode("하이", "하이  ", "foo", "bar"));
    }

    @Test
    @DisplayName("isNullToString: null이면 빈 문자열을 반환한다")
    void testIsNullToString() {
        assertEquals("", EgovStringUtil.isNullToString(null));
        assertEquals("hello", EgovStringUtil.isNullToString("  hello  "));
    }

    @Test
    @DisplayName("nullConvert(Object): null 또는 'null' 문자열이면 빈 문자열을 반환한다")
    void testNullConvertObject() {
        assertEquals("", EgovStringUtil.nullConvert((Object) null));
        assertEquals("", EgovStringUtil.nullConvert((Object) "null"));
        assertEquals("hello", EgovStringUtil.nullConvert((Object) "  hello  "));
    }
}
