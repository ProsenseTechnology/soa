<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Employee/V1"
                xmlns:rs="urn:control.services.tiplus2.misys.com"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                xmlns:id="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/NationalIdentity/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:msg="urn:messages.service.ti.apps.tiplus2.misys.com"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Branch/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Branch/V1/BranchEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Branch/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Misys/AppMetadata/V1/Control.xsd"/>
        <oracle-xsl-mapper:rootElement name="ServiceRequest" namespace="urn:control.services.tiplus2.misys.com"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI MAY 22 04:08:29 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <rs:ServiceRequest>
      <RequestHeader>
        <Service>TI</Service>
        <Operation>SwiftAddress</Operation>
        <ReplyFormat>FULL</ReplyFormat>
        <NoRepair>Y</NoRepair>
        <NoOverride>Y</NoOverride>
        <TransactionControl>NONE</TransactionControl>
        <CorrelationId>7402</CorrelationId>
      </RequestHeader>
      <msg:SwiftAddress>
        <msg:MaintType>A</msg:MaintType>
        <msg:MaintainedInBackOffice>Y</msg:MaintainedInBackOffice>
        <xsl:if test="/eo:Branch/com:BranchIdentifier/com:BankBIC">
          <msg:SWBank>
            <xsl:value-of select="substring(/eo:Branch/com:BranchIdentifier/com:BankBIC, 0, 3 )"/>
          </msg:SWBank>
        </xsl:if>
        <xsl:if test="/eo:Branch/com:BranchIdentifier/com:BankBIC">
          <msg:SWCountry>
            <xsl:value-of select="substring(/eo:Branch/com:BranchIdentifier/com:BankBIC, 4, 5 )"/>
          </msg:SWCountry>
        </xsl:if>
        <xsl:if test="/eo:Branch/com:BranchIdentifier/com:BankBIC">
          <msg:SWLocation>
            <xsl:value-of select="substring(/eo:Branch/com:BranchIdentifier/com:BankBIC, 6, 7 )"/>
          </msg:SWLocation>
        </xsl:if>
        <xsl:if test="/eo:Branch/com:BranchIdentifier/com:BankBIC">
          <msg:SWBranch>
            <xsl:value-of select="substring(/eo:Branch/com:BranchIdentifier/com:BankBIC, 8, 10 )"/>
          </msg:SWBranch>
        </xsl:if>
        <xsl:if test="/eo:Branch/eo:BankName">
          <msg:FINName>
            <xsl:value-of select="/eo:Branch/eo:BankName"/>
          </msg:FINName>
        </xsl:if>
        <xsl:if test="/eo:Branch/eo:BranchName">
          <msg:SwiftBranch>
            <xsl:value-of select="/eo:Branch/eo:BranchName"/>
          </msg:SwiftBranch>
        </xsl:if>
      </msg:SwiftAddress>
    </rs:ServiceRequest>
  </xsl:template>
</xsl:stylesheet>