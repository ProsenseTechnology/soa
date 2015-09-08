<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
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
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Transfer/V1/TransferEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Finacle/AppMetadata/xsds/FIXML.xsd"/>
        <oracle-xsl-mapper:rootElement name="FIXML" namespace="http://www.finacle.com/fixml"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:param name="date"/>
  <xsl:template match="/">
    <app:FIXML>
      <app:Header>
        <app:RequestHeader>
          <app:MessageKey>
            <app:RequestUUID>
              <xsl:value-of select="/eo:ESBMsg/com:MsgID"/>
            </app:RequestUUID>
            <app:ServiceRequestId>XferTrnAdd</app:ServiceRequestId>
            <app:ServiceRequestVersion>10.2</app:ServiceRequestVersion>
            <app:ChannelId>
              <xsl:value-of select="/eo:ESBMsg/com:Source"/>
            </app:ChannelId>
            <app:LanguageId/>
          </app:MessageKey>
          <app:RequestMessageInfo>
            <app:BankId>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:Transaction/com:AccountIdentifier/com:BankID"/>
            </app:BankId>
            <app:TimeZone/>
            <app:EntityId/>
            <app:EntityType/>
            <app:ArmCorrelationId/>
            <app:MessageDateTime>
              <xsl:value-of select="$date"/>
            </app:MessageDateTime>
          </app:RequestMessageInfo>
          <app:Security>
            <app:Token>
              <app:PasswordToken>
                <app:UserId/>
                <app:Password/>
              </app:PasswordToken>
            </app:Token>
            <app:FICertToken/>
            <app:RealUserLoginSessionId/>
            <app:RealUser/>
            <app:RealUserPwd/>
            <app:SSOTransferToken/>
          </app:Security>
        </app:RequestHeader>
      </app:Header>
      <app:Body>
        <app:XferTrnAddRequest>
          <app:XferTrnAddRq>
            <app:XferTrnHdr>
              <app:TrnType>T</app:TrnType>
              <app:TrnSubType>BI</app:TrnSubType>
            </app:XferTrnHdr>
            <app:XferTrnDetail>
              <xsl:for-each select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:Transaction">
                <app:PartTrnRec>
                  <app:AcctId>
                    <app:AcctId>
                      <xsl:value-of select="com:AccountIdentifier/com:AccountID"/>
                    </app:AcctId>
                    <app:AcctCurr>
                      <xsl:value-of select="com:AccountIdentifier/com:AccountCurrency"/>
                    </app:AcctCurr>
                  </app:AcctId>
                  <app:CreditDebitFlg>
                    <xsl:value-of select="com:TransactionType"/>
                  </app:CreditDebitFlg>
                  <app:TrnAmt>
                    <app:amountValue>
                      <xsl:value-of select="com:TransactionAmount"/>
                    </app:amountValue>
                    <app:currencyCode>
                      <xsl:value-of select="com:TransactionAmount/@currencyCode"/>
                    </app:currencyCode>
                  </app:TrnAmt>
                  <app:TrnParticulars>
                    <xsl:value-of select="substring(com:TransactionDescription,1,30)"/>
                  </app:TrnParticulars>
                  <app:PartTrnRmks>
                    <xsl:value-of select="substring(com:Remarks,1,30)"/>
                  </app:PartTrnRmks>
                  <app:ValueDt>
                    <xsl:value-of select="concat(substring(com:ValueDate,0,11),'T','00:00',':00.000')"/>
                  </app:ValueDt>
                  <Rate>
                    <xsl:value-of select="com:Rate"/>
                  </Rate>
                  <RateCode>
                    <xsl:if test="com:Rate">TTB</xsl:if>
                  </RateCode>
                  <app:SerialNum>
                    <xsl:value-of select="position()"/>
                  </app:SerialNum>
                </app:PartTrnRec>
              </xsl:for-each>
              <app:Remarks></app:Remarks>
            </app:XferTrnDetail>
          </app:XferTrnAddRq>
          <XferTrnAdd_CustomData>
            <xsl:for-each select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:Transaction">
              <PARTTRANDTLS isMultiRec="Y">
                <REFNUM>
                  <xsl:value-of select="com:TransactionReferenceNumber"/>
                </REFNUM>
                <SRLNUM>
                  <xsl:value-of select="position()"/>
                </SRLNUM>
              </PARTTRANDTLS>
            </xsl:for-each>
          </XferTrnAdd_CustomData>
        </app:XferTrnAddRequest>
      </app:Body>
    </app:FIXML>
  </xsl:template>
</xsl:stylesheet>