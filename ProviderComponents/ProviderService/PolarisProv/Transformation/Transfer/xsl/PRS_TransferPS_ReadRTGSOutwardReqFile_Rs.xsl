<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/Daptiv/Adapter/ftp"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:nxs="http://xmlns.oracle.com/pcbpel/nxsd"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:acceo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:adp="http://xmlns.equitybank.co.ke/ESB/PS/Polaris/Adapter/ftp"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/ftp/PRS_FTP_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="RTGSOutwardReqFileOutput"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Polaris/Adapter/ftp"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Transfer/V1/TransferEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <xsl:for-each select="/adp:RTGSOutwardReqFileOutput/adp:DataLine">
          <eo:Transfer>
            <com:TransferIdentifier>
              <com:BankID>
                <xsl:value-of select="adp:UnitID"/>
              </com:BankID>
            </com:TransferIdentifier>
            <com:Amount>
              <xsl:value-of select="adp:tranAmt"/>
            </com:Amount>
            <com:PayFromAccount>
              <com:AccountIdentifier>
                <com:AccountID>
                  <xsl:value-of select="adp:DrAcct"/>
                </com:AccountID>
              </com:AccountIdentifier>
              <com:PartyReference/>
            </com:PayFromAccount>
            <com:PayeeAccount>
              <com:AccountIdentifier>
                <com:BankID>
                  <xsl:value-of select="adp:UnitID"/>
                </com:BankID>
                <com:BankBIC>
                  <xsl:value-of select="DVMFunctions:lookupValue('ESBMetadata/DVM/BANK_BIC_CODES','BankCode#BranchCode',concat(substring (adp:BankCode, 1, 3 ),'#',substring (adp:BankCode, 4, 3 )),'BICCode','')"/>
                </com:BankBIC>
                <com:BranchID>
                  <xsl:value-of select="substring (adp:BankCode, 4, 3 )"/>
                </com:BranchID>
              </com:AccountIdentifier>
              <com:PartyReference>
                <com:PersonName>
                  <com:FullName>
                    <xsl:value-of select="adp:benCustName"/>
                  </com:FullName>
                </com:PersonName>
                <com:Address>
                  <com:LineOne>
                    <xsl:value-of select="adp:benCustAddr1"/>
                  </com:LineOne>
                  <com:LineTwo>
                    <xsl:value-of select="adp:benCustAddr2"/>
                  </com:LineTwo>
                  <com:LineThree>
                    <xsl:value-of select="adp:benCustAddr3"/>
                  </com:LineThree>
                </com:Address>
              </com:PartyReference>
            </com:PayeeAccount>
          </eo:Transfer>
        </xsl:for-each>
        <com:Status>
          <com:Code>ESB-00</com:Code>
          <com:Type>SUCCESS</com:Type>
        </com:Status>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
