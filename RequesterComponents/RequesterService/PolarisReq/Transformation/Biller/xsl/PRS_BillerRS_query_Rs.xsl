<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rs="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Biller/V1"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Biller/V1"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd eo rs oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:rcom="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Biller/V1/BillerEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Biller/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Biller/V1/BillerRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Biller/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU APR 30 19:46:34 PDT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <rs:ESBMsg>
      <rcom:MsgID>
        <xsl:value-of select="/eo:ESBMsg/com:MsgID"/>
      </rcom:MsgID>
      <xsl:if test="/eo:ESBMsg/eo:RsData">
        <rs:RsData>
          <xsl:for-each select="/eo:ESBMsg/eo:RsData/eo:Biller">
            <xsl:if test=".">
              <rs:Biller>
                <xsl:if test="eo:BillerName">
                  <eo:BillerName>
                    <xsl:value-of select="eo:BillerName"/>
                  </eo:BillerName>
                </xsl:if>
                <xsl:if test="com:BillerIdentifier">
                  <com:BillerIdentifier>
                    <xsl:if test="com:BillerIdentifier/com:BankID">
                      <com:BankID>
                        <xsl:value-of select="com:BillerIdentifier/com:BankID"/>
                      </com:BankID>
                    </xsl:if>
                    <xsl:if test="com:BillerIdentifier/com:BankBIC">
                      <com:BankBIC>
                        <xsl:value-of select="com:BillerIdentifier/com:BankBIC"/>
                      </com:BankBIC>
                    </xsl:if>
                    <xsl:if test="com:BillerIdentifier/com:BranchID">
                      <com:BranchID>
                        <xsl:value-of select="com:BillerIdentifier/com:BranchID"/>
                      </com:BranchID>
                    </xsl:if>
                    <xsl:if test="com:BillerIdentifier/com:AccountID">
                      <com:AccountID>
                        <xsl:value-of select="com:BillerIdentifier/com:AccountID"/>
                      </com:AccountID>
                    </xsl:if>
                    <xsl:if test="com:BillerIdentifier/com:IBAN">
                      <com:IBAN>
                        <xsl:value-of select="com:BillerIdentifier/com:IBAN"/>
                      </com:IBAN>
                    </xsl:if>
                    <xsl:if test="com:BillerIdentifier/com:AccountCurrency">
                      <com:AccountCurrency>
                        <xsl:value-of select="com:BillerIdentifier/com:AccountCurrency"/>
                      </com:AccountCurrency>
                    </xsl:if>
                    <xsl:if test="com:BillerIdentifier/com:BillerID">
                      <com:BillerID>
                        <xsl:value-of select="com:BillerIdentifier/com:BillerID"/>
                      </com:BillerID>
                    </xsl:if>
                  </com:BillerIdentifier>
                </xsl:if>
                <xsl:if test="eo:BillerType">
                  <eo:BillerType>
                    <xsl:value-of select="eo:BillerType"/>
                  </eo:BillerType>
                </xsl:if>
                <xsl:if test="eo:BillerName">
                  <eo:BillerName>
                    <xsl:value-of select="eo:BillerName"/>
                  </eo:BillerName>
                </xsl:if>
                <xsl:if test="eo:BillerStatus">
                  <eo:BillerStatus>
                    <xsl:value-of select="eo:BillerStatus"/>
                  </eo:BillerStatus>
                </xsl:if>
              </rs:Biller>
            </xsl:if>
          </xsl:for-each>
          <xsl:if test="/eo:ESBMsg/eo:RsData/com:Status">
            <com:Status>
              <xsl:if test="/eo:ESBMsg/eo:RsData/com:Status/com:Code">
                <com:Code>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/com:Status/com:Code"/>
                </com:Code>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/com:Status/com:Type">
                <com:Type>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/com:Status/com:Type"/>
                </com:Type>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/com:Status/com:Text">
                <com:Text>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/com:Status/com:Text"/>
                </com:Text>
              </xsl:if>
            </com:Status>
          </xsl:if>
        </rs:RsData>
      </xsl:if>
    </rs:ESBMsg>
  </xsl:template>
</xsl:stylesheet>