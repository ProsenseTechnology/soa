<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Instruments/Cheque/V1"
                xmlns:rs="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Cheque/V1"
                xmlns:rcom="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl eo com rs rcom oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Cheque/V1/ChequeRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Cheque/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Instruments/Cheque/V1/ChequeEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Instruments/Cheque/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <eo:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/rs:ESBMsg/rcom:MsgID"/>
      </com:MsgID>
      <com:Source>COR</com:Source>
      <com:MsgType>Requester</com:MsgType>
      <com:Service>ChequeES</com:Service>
      <xsl:if test="/rs:ESBMsg/rs:RqData">
        <eo:RqData actionCode="QueryChequeStatusByID">
          <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Cheque">
            <eo:Cheque>
              <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Cheque/com:ChequeIdentifier">
                <com:ChequeIdentifier>
                  <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Cheque/com:ChequeIdentifier/com:BankID">
                    <com:BankID>
                      <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Cheque/com:ChequeIdentifier/com:BankID"/>
                    </com:BankID>
                  </xsl:if>
                  
                    <com:BranchID>
                      <xsl:value-of select="substring (/rs:ESBMsg/rs:RqData/rs:Cheque/com:ChequeIdentifier/com:AccountID, 0, 4 )"/>
                    </com:BranchID>
                  
                  <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Cheque/com:ChequeIdentifier/com:AccountID">
                    <com:AccountID>
                      <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Cheque/com:ChequeIdentifier/com:AccountID"/>
                    </com:AccountID>
                  </xsl:if>
                  <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Cheque/com:ChequeIdentifier/com:ChequeID">
                    <com:ChequeID>
                      <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Cheque/com:ChequeIdentifier/com:ChequeID"/>
                    </com:ChequeID>
                  </xsl:if>
                </com:ChequeIdentifier>
              </xsl:if>
              <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Cheque/eo:BeginChequeNumber">
                <eo:BeginChequeNumber>
                  <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Cheque/eo:BeginChequeNumber"/>
                </eo:BeginChequeNumber>
              </xsl:if>
              <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Cheque/eo:EndChequeNumber">
                <eo:EndChequeNumber>
                  <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Cheque/eo:EndChequeNumber"/>
                </eo:EndChequeNumber>
              </xsl:if>
            </eo:Cheque>
          </xsl:if>
        </eo:RqData>
      </xsl:if>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
