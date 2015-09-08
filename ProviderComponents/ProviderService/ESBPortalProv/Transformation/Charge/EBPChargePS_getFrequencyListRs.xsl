<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Charge/V1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../ESBMetadata/ComponentLibrary/ProviderServices/ESBPortal/AppMetadata/xsds/Charges.xsd"/>
        <oracle-xsl-mapper:rootElement name="ForEachVO" namespace=""/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Charge/V1/ChargeEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Charge/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI AUG 14 11:21:46 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <xsl:for-each select="/ForEachVO/optionListVO/optionVO">
          <eo:Charge>
            <eo:ChargeFrequency>
              <xsl:value-of select="code"/>
            </eo:ChargeFrequency>
            <com:Remarks>
              <xsl:value-of select="description"/>
            </com:Remarks>
            <eo:LookupType>
              <xsl:value-of select="type"/>
            </eo:LookupType>
          </eo:Charge>
        </xsl:for-each>
        <com:Status>
          <xsl:choose>
            <xsl:when test="/ForEachVO/optionListVO/status='SUCCESS'">
              <com:Code>ESB-00</com:Code>
              <com:Type>Success</com:Type>
              <com:Text>
                <xsl:value-of select="/ForEachVO/optionListVO/message"/>
              </com:Text>
            </xsl:when>
            <xsl:otherwise>
              <com:Code>ESB-100</com:Code>
              <com:Type>Failure</com:Type>
              <com:Text>
                <xsl:value-of select="/ForEachVO/optionListVO/message"/>
              </com:Text>
            </xsl:otherwise>
          </xsl:choose>
        </com:Status>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>