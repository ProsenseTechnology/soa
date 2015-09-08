<?xml version="1.0" encoding="UTF-8" ?>
<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform">
    <template name="formatDate_From_DD-Mon-YY_To_YYYY-MM-DD">
    <param name="Date"/>
    <value-of select="concat('20',substring($Date,8,2))"/>
    <text>-</text>
    <choose>
            <when test="upper-case(substring($Date,4,3))='JAN'">
                <text>01</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='FEB'">
                <text>02</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='MAR'">
                <text>03</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='APR'">
                <text>04</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='MAY'">
                <text>05</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='JUN'">
                <text>06</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='JUL'">
                <text>07</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='AUG'">
                <text>08</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='SEP'">
                <text>09</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='OCT'">
                <text>10</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='NOV'">
                <text>11</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='DEC'">
                <text>12</text>
            </when>
        </choose>
    <text>-</text>
    <value-of select="substring($Date,1,2)"/>
</template>
 <template name="formatDate_From_DD-Mon-YY_To_YYYYMMDD">
    <param name="Date"/>
    <value-of select="concat('20',substring($Date,8,2))"/>
    
    <choose>
            <when test="upper-case(substring($Date,4,3))='JAN'">
                <text>01</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='FEB'">
                <text>02</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='MAR'">
                <text>03</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='APR'">
                <text>04</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='MAY'">
                <text>05</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='JUN'">
                <text>06</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='JUL'">
                <text>07</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='AUG'">
                <text>08</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='SEP'">
                <text>09</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='OCT'">
                <text>10</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='NOV'">
                <text>11</text>
            </when>
            <when test="upper-case(substring($Date,4,3))='DEC'">
                <text>12</text>
            </when>
        </choose>
    
    <value-of select="substring($Date,1,2)"/>
</template>
</stylesheet>

